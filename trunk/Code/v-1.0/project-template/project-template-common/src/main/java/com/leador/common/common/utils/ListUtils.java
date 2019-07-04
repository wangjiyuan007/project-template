package com.leador.common.common.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/**
 * @author ：shuquanliang
 * @date ：Created in 2019/4/28 10:28
 * @description：
 */
public class ListUtils {

    /**
     * 判断List是否为空
     *
     * @param list
     * @return
     */
    public static boolean isEmpty(List<?> list) {
        return list == null || list.size() == 0 || list.isEmpty();
    }

    /**
     * 判断List是否为非空
     *
     * @param list
     * @return
     */
    public static boolean isNotEmpty(List<?> list) {
        return !isEmpty(list);
    }

    /**
     * 如果List为空，返回不可变的空List
     *
     * @param list
     * @param <T>
     * @return
     */
    public static <T> List<T> emptyIfNull(final List<T> list) {
        return list == null ? Collections.<T>emptyList() : list;
    }

    /**
     * 返回2个List的交集
     *
     * @param list1
     * @param list2
     * @param <E>
     * @return
     */
    public static <E> List<E> intersection(final List<? extends E> list1, final List<? extends E> list2) {
        final List<E> result = new ArrayList<E>();

        if (isEmpty(list1) || isEmpty(list2)) {
            return result;
        }

        List<? extends E> smaller = list1;
        List<? extends E> larger = list2;
        if (list1.size() > list2.size()) {
            smaller = list2;
            larger = list1;
        }

        final HashSet<E> hashSet = new HashSet<E>(smaller);

        for (final E e : larger) {
            if (hashSet.contains(e)) {
                result.add(e);
                hashSet.remove(e);
            }
        }

        return result;
    }

}
