package com.sixfootsoftware.engine {
    public interface DoubleLinkedList {

        function setNext( logo:DoubleLinkedList ):void;

        function getNext():DoubleLinkedList;

        function setPrev( logo:DoubleLinkedList ):void;

        function getPrev():DoubleLinkedList;
    }
}
