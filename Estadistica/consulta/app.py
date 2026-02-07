# -*- coding: utf-8 -*-
# Consulta de Votos Universitarios - UD
# Este script utiliza Dash para crear una aplicación web interactiva que permite analizar los resultados de las
# elecciones universitarias de la Universidad Distrital Francisco José de Caldas.   
# La aplicación permite cargar un archivo Excel con los resultados, seleccionar el año y los candidatos,
# y visualizar los datos en gráficos y tablas.  
# Requiere las librerías: dash, dash-bootstrap-components, pandas, io, base64, colorsys
# Fecha: 2025-08-15

# Importar librerías necesarias
import dash
from dash import dcc, html, Input, Output, State, dash_table, callback, no_update
import dash_bootstrap_components as dbc
import pandas as pd
import io
import base64
from dash.exceptions import PreventUpdate
import colorsys

# Paleta de colores pastel por año
YEAR_COLORS = {
    "2016": "#FFB6C1",  # Rosa claro
    "2017": "#FFD700",  # Oro claro
    "2018": "#98FB98",  # Verde pálido
    "2019": "#ADD8E6",  # Azul claro
    "2020": "#DDA0DD",  # Violeta pálida
    "2021": "#FFA07A",  # Salmón ligero
    "2022": "#87CEFA",  #LightSkyBlue
    "2023": "#90EE90",  # Verde claro
    "2024": "#FFA500"   #NaranjaClaro
}

# Colores base para candidatos (se generará dinámicamente)
BASE_COLORS = [
    "#FF9AA2", "#FFB7B2", "#FFDAC1", "#E2F0CB",
    "#B5EAD7", "#C7CEEA", "#F8B195", "#F67280",
    "#C06C84", "#6C5B7B", "#355C7D"
]

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])
app.title = "Análisis de Votos Universitarios - UD"

app.layout = dbc.Container([
    dbc.Row(
        dbc.Col([
            html.H1(" Participación Electoral UD", className="text-center my-4"),
            dcc.Upload(
                id='upload-data',
                children=html.Div(['Arrastra o selecciona el archivo Excel']),
                style={
                    'width': '100%',
                    'height': '60px',
                    'lineHeight': '60px',
                    'borderWidth': '1px',
                    'borderStyle': 'dashed',
                    'borderRadius': '5px',
                    'textAlign': 'center',
                    'marginBottom': '20px'
                },
                multiple=False
            )
        ], width=12)
    ),
    
    dbc.Row(
        dbc.Col(
            html.Div(id='status-message', style={'color': 'blue', 'marginBottom': '20px'}),
            width=12
        )
    ),
    
    dbc.Row([
        dbc.Col([
            html.Label(" Año:", className="font-weight-bold"),
            dcc.Dropdown(
                id='year-dropdown', 
                options=[], 
                placeholder="Seleccione un año...",
                clearable=False
            )
        ], md=6),
        dbc.Col([
            html.Label(" Candidato(s):", className="font-weight-bold"),
            dcc.Dropdown(
                id='candidate-dropdown', 
                options=[], 
                placeholder="Seleccione candidato(s)...",
                multi=True
            )
        ], md=6)
    ], className="mb-4"),
    
    dbc.Row([
        dbc.Col(dcc.Graph(id='participation-graph'), width=12, className="mb-4"),
    ]),
    
    dbc.Row([
        dbc.Col(
            dash_table.DataTable(
                id='results-table',
                style_table={'overflowX': 'auto'},
                style_cell={
                    'textAlign': 'left',
                    'padding': '8px',
                    'border': '1px solid lightgrey'
                },
                style_header={
                    'backgroundColor': 'rgb(230, 230, 230)',
                    'fontWeight': 'bold',
                    'border': '1px solid grey'
                },
                style_data_conditional=[]
            ), 
            width=12,
            className="mb-4"
        )
    ]),
    
    dbc.Row([
        dbc.Col(
            html.Div(id='total-votes-display', style={
                'backgroundColor': '#f8f9fa',
                'padding': '15px',
                'borderRadius': '5px',
                'marginBottom': '20px'
            }),
            width=12
        )
    ])
], fluid=True)

def parse_excel(contents, sheet_name):
    """Process Excel file with proper structure"""
    try:
        content_type, content_string = contents.split(',')
        decoded = base64.b64decode(content_string)
        
        df = pd.read_excel(
            io.BytesIO(decoded),
            sheet_name=sheet_name,
            header=None
        ).dropna(how='all')
        
       # Reconstruir DataFrame
        new_df = pd.DataFrame({
            'Lista': df.iloc[2:, 1].fillna('Otros'),
            'Candidato': df.iloc[2:, 2].astype(str).replace('nan', None),
            'Egresados': pd.to_numeric(df.iloc[2:, 3], errors='coerce').fillna(0),
            'Administrativos': pd.to_numeric(df.iloc[2:, 4], errors='coerce').fillna(0),
            'Docentes': pd.to_numeric(df.iloc[2:, 5], errors='coerce').fillna(0),
            'Estudiantes': pd.to_numeric(df.iloc[2:, 6], errors='coerce').fillna(0)
        }).dropna(subset=['Candidato'])
        
        # Manejo especial para 2016
        if sheet_name == '2016' and df.shape[1] > 7:
            new_df['VINES'] = pd.to_numeric(df.iloc[2:, 7], errors='coerce').fillna(0)
            new_df['Docentes + VINES'] = new_df['Docentes'] + new_df['VINES']
        
        return new_df
    
    except Exception as e:
        raise ValueError(f"Error al procesar {sheet_name}: {str(e)}")

def generate_colors(n, base_color=None):
    """Generate distinct colors for candidates"""
    if not base_color:
        base_hue = 0  # Empiece con un tono rojo
    else:
       # Convertir Hex a RGB y luego a HSL
        rgb = tuple(int(base_color.lstrip('#')[i:i+2], 16) for i in (0, 2, 4))
        h, l, s = colorsys.rgb_to_hls(*[x/255 for x in rgb])
        base_hue = h
    
    colors = []
    for i in range(n):
        hue = (base_hue + (i * 0.618033988749895)) % 1.0  # Espacio de oro
        lightness = 0.85  # Mantenga los colores Light/Pastel
        saturation = 0.7
        rgb = colorsys.hls_to_rgb(hue, lightness, saturation)
        hex_color = "#{:02x}{:02x}{:02x}".format(
            int(rgb[0] * 255),
            int(rgb[1] * 255),
            int(rgb[2] * 255)
        )
        colors.append(hex_color)
    return colors

@app.callback(
    [Output('year-dropdown', 'options'),
     Output('year-dropdown', 'value'),
     Output('candidate-dropdown', 'options'),
     Output('candidate-dropdown', 'value')],
    [Input('upload-data', 'contents'),
     Input('year-dropdown', 'value')],
    prevent_initial_call=True
)
def update_dropdowns(contents, selected_year):
    ctx = dash.callback_context
    triggered_id = ctx.triggered[0]['prop_id'].split('.')[0]
    
    if not contents:
        raise PreventUpdate
    
    try:
        content_type, content_string = contents.split(',')
        decoded = base64.b64decode(content_string)
        xls = pd.ExcelFile(io.BytesIO(decoded))
        
        year_options = [{'label': sheet, 'value': sheet} for sheet in xls.sheet_names]
        
        # Si se activa por la carga de archivo
        if triggered_id == 'upload-data':
            df = parse_excel(contents, xls.sheet_names[0])
            candidate_options = [{'label': cand, 'value': cand} for cand in df['Candidato'].unique() if cand]
            return year_options, xls.sheet_names[0], candidate_options, None
        
        # Si se activan por el cambio del año
        elif triggered_id == 'year-dropdown' and selected_year:
            df = parse_excel(contents, selected_year)
            candidate_options = [{'label': cand, 'value': cand} for cand in df['Candidato'].unique() if cand]
            return no_update, no_update, candidate_options, None
            
    except Exception as e:
        print(f"Error al actualizar dropdowns: {str(e)}")
        return [], None, [], None
    
    raise PreventUpdate

@app.callback(
    [Output('participation-graph', 'figure'),
     Output('results-table', 'data'),
     Output('results-table', 'columns'),
     Output('results-table', 'style_data_conditional'),
     Output('total-votes-display', 'children')],
    [Input('year-dropdown', 'value'),
     Input('candidate-dropdown', 'value')],
    State('upload-data', 'contents'),
    prevent_initial_call=True
)
def update_outputs(selected_year, selected_candidates, contents):
    if not selected_year or not contents:
        raise PreventUpdate
    
    try:
        df = parse_excel(contents, selected_year)
        
        # Aplicar el filtro candidato si existe
        if selected_candidates:
            if isinstance(selected_candidates, str):
                selected_candidates = [selected_candidates]
            df = df[df['Candidato'].isin(selected_candidates)]
        
        # Determinar columnas para mostrar
        estamentos = ['Egresados', 'Administrativos', 'Docentes + VINES', 'Estudiantes'] if selected_year == '2016' and 'Docentes + VINES' in df.columns else ['Egresados', 'Administrativos', 'Docentes', 'Estudiantes']
        estamentos = [e for e in estamentos if e in df.columns]
        
        # Generar colores basados en el año y el número de candidatos
        year_color = YEAR_COLORS.get(selected_year, "#CCCCCC")
        if selected_candidates:
            candidate_colors = generate_colors(len(selected_candidates), year_color)
            color_map = dict(zip(selected_candidates, candidate_colors))
        else:
            color_map = {}
        
        # Crear datos de tabla con la fila total
        table_data = df[['Lista', 'Candidato'] + estamentos].to_dict('records')
        
        # Agregar fila total
        if len(table_data) > 0:
            total_row = {'Lista': 'TOTAL', 'Candidato': 'TODOS LOS SELECCIONADOS'}
            for e in estamentos:
                total_row[e] = int(df[e].sum())
            table_data.append(total_row)
        
        # Crear condiciones de color para la tabla
        color_conditions = []
        for i, row in enumerate(table_data):
            if row['Candidato'] in color_map:
                color_conditions.append({
                    'if': {'row_index': i},
                    'backgroundColor': color_map[row['Candidato']],
                    'color': '#333333'
                })
            elif row['Candidato'] == 'TODOS LOS SELECCIONADOS':
                color_conditions.append({
                    'if': {'row_index': i},
                    'backgroundColor': '#333333',
                    'color': 'white',
                    'fontWeight': 'bold'
                })
        
        # Crear columnas para la tabla
        columns = [
            {'name': 'Lista', 'id': 'Lista'},
            {'name': 'Candidato', 'id': 'Candidato'}
        ] + [{'name': e, 'id': e, 'type': 'numeric', 'format': {'specifier': ','}} for e in estamentos]
        
        # Crear gráfico
        if selected_candidates:
            # Gráfico de barras agrupadas para candidatos seleccionados
            fig_data = []
            for i, candidate in enumerate(selected_candidates):
                cand_df = df[df['Candidato'] == candidate]
                if not cand_df.empty:
                    fig_data.append({
                        'x': estamentos,
                        'y': [int(cand_df[e].sum()) for e in estamentos],
                        'type': 'bar',
                        'name': candidate,
                        'marker': {'color': color_map[candidate]},
                        'hovertemplate': '<b>%{x}</b><br>%{y:,} votos<br>Candidato: %{name}<extra></extra>'
                    })
            
            # Agregar rastreo total
            fig_data.append({
                'x': estamentos,
                'y': [int(df[e].sum()) for e in estamentos],
                'type': 'bar',
                'name': 'TOTAL',
                'marker': {'color': '#333333', 'opacity': 0.6},
                'hovertemplate': '<b>%{x}</b><br>Total: %{y:,}<extra></extra>'
            })
            
            fig_layout = {
                'title': f'Votos por Estamento ({selected_year})',
                'yaxis': {'title': 'Número de Votos'},
                'barmode': 'group',
                'hovermode': 'closest',
                'legend': {'orientation': 'h', 'y': -0.2}
            }
        else:
            # Gráfico de barra simple cuando no hay candidatos seleccionados
            totals = {e: int(df[e].sum()) for e in estamentos}
            fig_data = [{
                'x': list(totals.keys()),
                'y': list(totals.values()),
                'type': 'bar',
                'marker': {'color': year_color},
                'hovertemplate': '<b>%{x}</b><br>Votos: %{y:,}<extra></extra>',
                'name': 'Total'
            }]
            fig_layout = {
                'title': f'Votos Totales por Estamento ({selected_year})',
                'yaxis': {'title': 'Número de Votos'},
                'hovermode': 'closest'
            }
        
        fig = {'data': fig_data, 'layout': fig_layout}
        
        # Crear votos totales.
        total_votes = sum([int(df[e].sum()) for e in estamentos])
        vote_details = []
        for e in estamentos:
            vote_count = int(df[e].sum())
            percentage = (vote_count / total_votes * 100) if total_votes > 0 else 0
            vote_details.append(
                html.Div([
                    html.Span(f"{e}: ", style={'fontWeight': 'bold'}),
                    html.Span(f"{vote_count:,} votos ({percentage:.1f}%)")
                ], style={'marginRight': '20px', 'display': 'inline-block'})
            )
        
        total_display = html.Div([
            html.H4("Resumen Total de Votos", style={'marginBottom': '10px'}),
            html.Div(vote_details),
            html.Div([
                html.Span("Total General: ", style={'fontWeight': 'bold'}),
                html.Span(f"{total_votes:,} votos")
            ], style={'marginTop': '10px', 'fontSize': '1.1em'})
        ])
        
        return fig, table_data, columns, color_conditions, total_display
    
    except Exception as e:
        error_msg = f" Error: {str(e)}"
        print(f"Error detallado: {str(e)}")
        return {}, [], [], [], html.Div(error_msg, style={'color': 'red'})

if __name__ == '__main__':
    app.run(debug=True)
