#ifndef PATROON_UTILS_H
#define PATROON_UTILS_H

#include <string>
#include <vector>

void ltrim(std::string &s);
void rtrim(std::string &s);
void trim(std::string &s);
bool strStartsWith(const std::string &str, const std::string &pref);
bool compareTol(double x, double y, double tol);
bool numberWithin(double x, double minVal, double maxVal, double tol);
void normalizeNums(std::vector<double> &v);

#endif
