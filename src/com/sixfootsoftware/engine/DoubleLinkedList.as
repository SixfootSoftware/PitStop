package com.sixfootsoftware.engine {
    public interface DoubleLinkedList {

        function setNext( item:DoubleLinkedList ):void;

        function getNext():DoubleLinkedList;

        function setPrev( item:DoubleLinkedList ):void;

        function getPrev():DoubleLinkedList;
    }
}
