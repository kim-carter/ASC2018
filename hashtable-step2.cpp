#include <unordered_map>
#include <string>
#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <ctime>
#include <chrono>


/*

##
## Kim Carter 2018.   Testing C++ unordered map package for hashtable speed.  Step 2 tests insert then search performance
## 



to compile: g++ -std=c++11 hashtable.cpp -o cpp-step2


*/
using namespace std;
using namespace std::chrono;

int main()
{
	unordered_map <string, string> hashtable;


	std::ifstream file("testdata.tsv");
	if (file.is_open())
       	{
		std::string line;

		high_resolution_clock::time_point t1 = high_resolution_clock::now();

		while (getline(file, line))
	       	{
			const char * delim = "\t";
			std::size_t current, previous = 0;
			current = line.find(delim);
			std::string first = line.substr(previous, current - previous);
			previous = current + 1;
			current = line.find(delim, previous);
			std::string second = line.substr(previous, current - previous);


			//char* first = strtok(line.c_str(),delim);
			//char* second = strtok(line,delim);

			hashtable.emplace(std::string(first),std::string(second));
			//std::cout << first << "->" << second << std::endl;
		}
	}
	file.close();




	std::ifstream file2("/data/testsearch.tsv");
	int counter=0;
	int found=0;
	if (file2.is_open())
       	{
		std::string line;

		high_resolution_clock::time_point t1 = high_resolution_clock::now();

		while (getline(file2, line))
	       	{
		        // using printf() in all tests for consistency
			//#printf("%s", line.c_str());
			const char * delim = "\t";
			std::size_t current, previous = 0;
			current = line.find(delim);
			std::string first = line.substr(previous, current - previous);
			previous = current + 1;
			current = line.find(delim, previous);
			std::string second = line.substr(previous, current - previous);

			
			//char* first = strtok(line.c_str(),delim);
			//char* second = strtok(line,delim);

			auto search = hashtable.find(std::string(second));
			if (search != hashtable.end())
			{
				string tmp = search->second;
				//std::cout << "tmp: " << tmp << std::endl;
				found++;
			}

			counter++;
			if (counter % 100000 == 0)
			{
				//const time_t ctt = time(0);
  				//std::cout << asctime(localtime(&ctt)) << "Done " << counter << " records " << std::endl;
				//std::cout << asctime(localtime(&ctt));

				high_resolution_clock::time_point t2 = high_resolution_clock::now();
				duration<double, std::milli> time_span = t2 - t1;
				std::cout << time_span.count()/1000 << std::endl;
				t1 = t2;

  			}

		}
	}
	file2.close();
	//std::cout << "Found = " << found << std::endl;

	return 0;
}
