// Lean compiler output
// Module: Kmpstudy.Basic.PrefixSuffix
// Imports: public import Init public import Kmpstudy.Basic.Strings public import Mathlib.Data.List.Basic public import Mathlib.Data.List.Range public import Mathlib.Data.Nat.Find
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* l_List_lengthTR___redArg(lean_object*);
LEAN_EXPORT uint8_t lp_kmpstudy_KMP_isBorderB(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
lean_object* l_List_mapTR_loop___redArg(lean_object*, lean_object*, lean_object*);
lean_object* l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps___redArg___lam__0(lean_object*, lean_object*, lean_object*);
uint8_t l_instDecidableEqList___redArg(lean_object*, lean_object*, lean_object*);
lean_object* l_List_range(lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lpsVal___redArg(lean_object*, lean_object*);
LEAN_EXPORT uint8_t lp_kmpstudy_KMP_isBorderB___redArg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lpsVal___redArg___lam__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_isBorderB___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* lp_mathlib_Nat_findGreatest___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps___redArg___lam__0___boxed(lean_object*, lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_isBorderB___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint8_t lp_kmpstudy_KMP_lpsVal___redArg___lam__0(lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
static lean_object* lp_kmpstudy_KMP_isBorderB___redArg___closed__0;
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lpsVal(lean_object*, lean_object*, lean_object*);
lean_object* l_List_drop___redArg(lean_object*, lean_object*);
static lean_object* _init_lp_kmpstudy_KMP_isBorderB___redArg___closed__0() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT uint8_t lp_kmpstudy_KMP_isBorderB___redArg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = l_List_lengthTR___redArg(x_2);
x_5 = lean_nat_dec_lt(x_3, x_4);
if (x_5 == 0)
{
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
lean_dec_ref(x_1);
return x_5;
}
else
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; uint8_t x_10; 
x_6 = lp_kmpstudy_KMP_isBorderB___redArg___closed__0;
lean_inc(x_3);
lean_inc(x_2);
x_7 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_2, x_2, x_3, x_6);
x_8 = lean_nat_sub(x_4, x_3);
lean_dec(x_3);
lean_dec(x_4);
x_9 = l_List_drop___redArg(x_8, x_2);
lean_dec(x_2);
x_10 = l_instDecidableEqList___redArg(x_1, x_7, x_9);
return x_10;
}
}
}
LEAN_EXPORT uint8_t lp_kmpstudy_KMP_isBorderB(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lp_kmpstudy_KMP_isBorderB___redArg(x_2, x_3, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_isBorderB___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; lean_object* x_6; 
x_5 = lp_kmpstudy_KMP_isBorderB(x_1, x_2, x_3, x_4);
x_6 = lean_box(x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_isBorderB___redArg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; lean_object* x_5; 
x_4 = lp_kmpstudy_KMP_isBorderB___redArg(x_1, x_2, x_3);
x_5 = lean_box(x_4);
return x_5;
}
}
LEAN_EXPORT uint8_t lp_kmpstudy_KMP_lpsVal___redArg___lam__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; 
x_4 = lp_kmpstudy_KMP_isBorderB___redArg(x_1, x_2, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lpsVal___redArg___lam__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
uint8_t x_4; lean_object* x_5; 
x_4 = lp_kmpstudy_KMP_lpsVal___redArg___lam__0(x_1, x_2, x_3);
x_5 = lean_box(x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lpsVal___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; 
lean_inc(x_2);
x_3 = lean_alloc_closure((void*)(lp_kmpstudy_KMP_lpsVal___redArg___lam__0___boxed), 3, 2);
lean_closure_set(x_3, 0, x_1);
lean_closure_set(x_3, 1, x_2);
x_4 = l_List_lengthTR___redArg(x_2);
lean_dec(x_2);
x_5 = lp_mathlib_Nat_findGreatest___redArg(x_3, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lpsVal(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_kmpstudy_KMP_lpsVal___redArg(x_2, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps___redArg___lam__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_4 = lean_unsigned_to_nat(1u);
x_5 = lean_nat_add(x_3, x_4);
x_6 = lp_kmpstudy_KMP_isBorderB___redArg___closed__0;
lean_inc(x_1);
x_7 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_1, x_1, x_5, x_6);
lean_dec(x_1);
x_8 = lp_kmpstudy_KMP_lpsVal___redArg(x_2, x_7);
return x_8;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps___redArg___lam__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_kmpstudy_KMP_lps___redArg___lam__0(x_1, x_2, x_3);
lean_dec(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps___redArg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
lean_inc(x_2);
x_3 = lean_alloc_closure((void*)(lp_kmpstudy_KMP_lps___redArg___lam__0___boxed), 3, 2);
lean_closure_set(x_3, 0, x_2);
lean_closure_set(x_3, 1, x_1);
x_4 = l_List_lengthTR___redArg(x_2);
lean_dec(x_2);
x_5 = l_List_range(x_4);
x_6 = lean_box(0);
x_7 = l_List_mapTR_loop___redArg(x_3, x_5, x_6);
return x_7;
}
}
LEAN_EXPORT lean_object* lp_kmpstudy_KMP_lps(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_kmpstudy_KMP_lps___redArg(x_2, x_3);
return x_4;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_kmpstudy_Kmpstudy_Basic_Strings(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Data_List_Basic(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Data_List_Range(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Data_Nat_Find(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_kmpstudy_Kmpstudy_Basic_PrefixSuffix(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_kmpstudy_Kmpstudy_Basic_Strings(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Data_List_Basic(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Data_List_Range(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Data_Nat_Find(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
lp_kmpstudy_KMP_isBorderB___redArg___closed__0 = _init_lp_kmpstudy_KMP_isBorderB___redArg___closed__0();
lean_mark_persistent(lp_kmpstudy_KMP_isBorderB___redArg___closed__0);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
