#pragma once

#ifndef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN extern
#endif

#ifdef __GNUC__
#define EXPORT __attribute__((visibility ("default")))
#ifdef _WIN32
#define EXPORT __declspec(dllexport)
#else

#define EXTERN_EXPORT EXTERN EXPORT
