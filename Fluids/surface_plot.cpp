#include <iostream>
#include <fstream>
#include <cmath>

// Function to calculate z = sin(sqrt(x^2 + y^2)) / sqrt(x^2 + y^2)
double f(double x, double y) {
    double r = sqrt(x * x + y * y);
    return (r == 0) ? 0 : sin(r) / r; // Handle division by zero
}

int main() {
    // Define the range and resolution
    const int points = 41;
    const double min_range = -8.0, max_range = 8.0;
    const double step = (max_range - min_range) / (points - 1);

    // Create a data file for gnuplot
    std::ofstream data_file("surface_data.dat");
    if (!data_file) {
        std::cerr << "Error: Unable to create data file!" << std::endl;
        return 1;
    }

    // Generate the data
    for (int i = 0; i < points; ++i) {
        double x = min_range + i * step;
        for (int j = 0; j < points; ++j) {
            double y = min_range + j * step;
            double z = f(x, y);
            data_file << x << " " << y << " " << z << "\n";
        }
        data_file << "\n"; // Separate rows for gnuplot
    }
    data_file.close();

    // Create a gnuplot script
    std::ofstream gnuplot_script("plot_surface.gp");
    if (!gnuplot_script) {
        std::cerr << "Error: Unable to create gnuplot script!" << std::endl;
        return 1;
    }

    gnuplot_script << "set terminal wxt\n";
    gnuplot_script << "set dgrid3d 41,41\n";
    gnuplot_script << "set hidden3d\n";
    gnuplot_script << "set title '3D Surface Plot'\n";
    gnuplot_script << "splot 'surface_data.dat' with lines\n";
    gnuplot_script.close();

    // Run gnuplot to display the plot
    system("gnuplot -p plot_surface.gp");

    return 0;
}