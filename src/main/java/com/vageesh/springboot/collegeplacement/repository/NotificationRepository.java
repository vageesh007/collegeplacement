package com.vageesh.springboot.collegeplacement.repository;

import com.vageesh.springboot.collegeplacement.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
}
