#! /bin/bash

calc_menu(){
  
  while [[ $operator != "g" ]]
  do
    echo "a. Add"
    echo "b. Subtract"
    echo "c. Multiply"
    echo "d. Divide"
    echo "e. Power of"
    echo "f. Modulos"
    echo "g. Exit"
    read -p "Please enter two numbers: " num1 num2
    calc_validate $num1
    calc_validate $num2
    read -p "Please enter operator: " operator
    case $operator in
      "a") add $num1 $num2;;
	  "b") subtract $num1 $num2;;
	  "c") multiply $num1 $num2;;
	  "d") divide $num1 $num2;; 
	  "e") power $num1 $num2;;
	  "f") modulus $num1 $num2;;
	esac
	echo "The number is:" $result
	prime $result
	odd_even $result
	is_div_by_five $result
  done
}

calc_validate(){
  num=$1
  while ! [[ $num =~ ^[0-9]+$ ]]
  do
    read -p "Please enter a number: " num
  done
}

prime(){
  f=1
  if [[ $1 -lt 0 ]]; then
    i=-2
    while [[ $i -gt $1 && $f -eq 1 ]]
    do
	  if [[ $(($1%i)) -eq 0 ]]; then
	    f=0
	  fi
	  let "i--"
    done
  else
    i=2
    while [[ $i -lt $1 && $f -eq 1 ]]
    do
	  if [[ $(($1%i)) -eq 0 ]]; then
	    f=0
	  fi
	  let "i++"
    done
  fi
  if [[ f -eq 1 ]]; then
    echo "The number is prime."
  else
    echo "The number isn't prime."
  fi  
}

odd_even(){
  if [[ $(($1 % 2)) == 0 ]]; then
    echo "Even number."
  else
    echo "Odd number."
  fi
}

is_div_by_five(){
  if [[ $(($1 % 5)) == 0 ]]; then
    echo "Divide by five."
  fi
}

add(){
  result=$(($1+$2))  
}

subtract(){
  result=$(($1-$2)) 
}

multiply() {
  result=$(($1*$2))
}

divide() {
  result=$(($1/$2))
}

power() {
  result=1
  for ((i=1;i<=$2;i++))
  do
    let "result *= $1"
  done
}

modulus() {
  result=$(($1%$2))
}

calc_menu
