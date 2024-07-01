
export module data_type:containers;

// sequence containers

export import <array>;
export template<typename... T>
using arr = std::array<T...>;
export import <vector>;
export template<typename... T>
using vec = std::vector<T...>;
export import <deque>;
export using std::deque;
export import <forward_list>;
export template<typename... T>
using flist = std::forward_list<T...>;
export import <list>;
export using std::list;

// associative containers

export import <set>;
export using tree_set  = std::set;
export using tree_mset = std::multiset;
export import <unordered_set>;
export using hash_set  = std::unordered_set;
export using hash_mset = std::unordered_multiset;
export import <map>;
export using tree_map  = std::map;
export using tree_mmap = std::multimap;
export import <unordered_map>;
export using hash_map  = std::unordered_map;
export using hash_mmap = std::unordered_multimap;

// container adaptors

export import <stack>;
export using std::stack;
export import <queue>;
export using std::queue;
export template<typename... T>
using pqueue = std::priority_queue<T...>;
