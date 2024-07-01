
export module data_type:utilities;

// utility

export import <utility>;
using std::pair;

// tuple

export import <tuple>;
export template<typename... T>
using tup = std::tuple<T...>;

// functional

export import <functional>;
export template<typename... T>
using fn = std::function<T...>;

// optional

export import <optional>;
export template<typename... T>
using opt = std::optional<T...>;
