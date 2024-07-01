
export import prelude.data_type:containers;

// sequence containers

export import <array>;
export template<typename... T>
using arr = std::array<T...>;

export import <vector>;
export template<typename... T>
using vec = std::vector<T...>;

export import <deque>;
export template<typename... T>
using deque = std::deque<T...>;

export import <forward_list>;
export template<typename... T>
using flist = std::forward_list<T...>;

export import <list>;
export using std::list;

// associative containers

export import <set>;
export import <unordered_set>;
export template<typename... T>
using tree_set = std::set<T...>;
export template<typename... T>
using tree_mset = std::multiset<T...>;
export template<typename... T>
using hash_set = std::unordered_set<T...>;
export template<typename... T>
using hash_mset = std::unordered_multiset<T...>;

export import <map>;
export import <unordered_map>;
export template<typename... T>
using tree_map = std::map<T...>;
export template<typename... T>
using tree_mmap = std::multimap<T...>;
export template<typename... T>
using hash_map = std::unordered_map<T...>;
export template<typename... T>
using hash_mmap = std::unordered_multimap<T...>;

// container adaptors

export import <array>;
export template<typename... T>
using stack = std::stack<T...>;

export import <vector>;
export template<typename... T>
using queue = std::vector<T...>;

export import <deque>;
export template<typename... T>
using pqueue = std::priority_queue<T...>;
