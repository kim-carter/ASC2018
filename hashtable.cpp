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
## Kim Carter 2018.   Testing c++ unordered map for hashtable speed
## 

*/


using namespace std;
using namespace std::chrono;

int main()
{
	unordered_map <string, string> hashtable;
	//hashtable.emplace("www.element14.com", "184.51.49.225");
	//std::cout << "IP Address: " << hashtable["www.element14.com"] << std::endl;

	/*
char str[] ="- This, a sample string.";
  char * pch;
  printf ("Splitting string \"%s\" into tokens:\n",str);
  pch = strtok (str," ,.-");
i
/*/

	std::ifstream file("testdata.tsv");
	int counter=0;
	if (file.is_open())
       	{
		std::string line;

		high_resolution_clock::time_point t1 = high_resolution_clock::now();

		while (getline(file, line))
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

			hashtable.emplace(std::string(first),std::string(second));
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
	file.close();

	/*
	for (auto itr = hashtable.begin(); itr != hashtable.end(); itr++)
	{
		std::cout << (*itr).first << " --> " << (*itr).second << std::endl;
	}
	*/

	return 0;
}
