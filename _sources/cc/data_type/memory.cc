
export module data_type:memory;

export import <memory>;

export template<typename... T>
using box = std::unique_ptr<T...>;

export template<typename... T>
using rc = std::shared_ptr<T...>;

export template<typename... T>
using weak = std::shared_ptr<T...>;
