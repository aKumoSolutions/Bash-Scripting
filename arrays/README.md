# Bash Scripting for SysAdmins
---
<p align="center">
  <img width="350" height="250" src="../img/basharrays.png">
</p>

## Array Variables
An array is a variable containing multiple values. Any variable may be used as an array. There is no maximum limit to the size of an array, nor any requirement that member variables be indexed or assigned contiguously. Arrays are zero-based: the first element is indexed with the number 0.

## Defining arrays

```
Fruits=('Apple' 'Banana' 'Orange')
```
```
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"
```
```
ARRAY2=(foo{1..2}) # => foo1 foo2
```
```
ARRAY3=({A..D})    # => A B C D
```

## Indexing

| Index  | Element |
| ------------- | ------------- |
| ${Fruits[0]}  | First Element  |
| ${Fruits[-1]}  | Last Element |
| ${Fruits[*]}  | All Elements  |
| ${Fruits[@]}  | All Elements |
| ${#Fruits[@]}  | Number of all  |
| ${#Fruits}  | Lenght of 1st |
| ${#Fruits[3]}  | Lenght of nth  |
| ${Fruits[@]:3:2}  | Range |
| ${!Fruits[@]}  | Keys of all |

## Scripts

| Script  |
| ------------- |
| [interation.sh](iteration.sh)  |
| [withindex.sh](withindex.sh)  |

## Useful Pages
[Arrays in Bash](https://www.gnu.org/software/bash/manual/html_node/Arrays.html#:~:text=Bash%20provides%20one%2Ddimensional%20indexed,be%20indexed%20or%20assigned%20contiguously.)

[Bash Beginners Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html)
