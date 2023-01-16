Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C60ED66CFCE
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 20:51:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673898668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A3CZQMUf8x7RAqRCSqIKH94VDNYFLYXyCtkF1UDXrCA=;
	b=SxTR0gEsZ5WqQCDjbm7nabeZRpodxT1ny7H8kQXjt/HrgzhENuXoDNwUW1+uSFDe9lMb3C
	zXCqQjmiCrd/SzmTnhVz/Fs0ISLvMqC6vPHFOf63Z/5023cBsOiYS7G2fODDOH9a4wlkd4
	s73Mox1MslPWYEYp9FVeNnT/mB2Ap9M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-GGwlTFvYM12Voj5TVlaXqA-1; Mon, 16 Jan 2023 14:51:02 -0500
X-MC-Unique: GGwlTFvYM12Voj5TVlaXqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05B45811E6E;
	Mon, 16 Jan 2023 19:51:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11A65C15BAE;
	Mon, 16 Jan 2023 19:50:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CDE6B19465B8;
	Mon, 16 Jan 2023 19:50:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25825194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B194714171BB; Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8792914171B8;
 Mon, 16 Jan 2023 19:50:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 16 Jan 2023 14:50:50 -0500
Message-Id: <20230116195051.2858791-2-aahringo@redhat.com>
In-Reply-To: <20230116195051.2858791-1-aahringo@redhat.com>
References: <20230116195051.2858791-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCHv2 dlm-tool 2/3] dlm_controld: constify
 lsnames
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch constify some ls name parameter which are used read only in
ls_create() and ls_find().
---
 dlm_controld/dlm_daemon.h | 2 +-
 dlm_controld/main.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
index b829e0de..f0bad90f 100644
--- a/dlm_controld/dlm_daemon.h
+++ b/dlm_controld/dlm_daemon.h
@@ -479,7 +479,7 @@ int client_add(int fd, void (*workfn)(int ci), void (*deadfn)(int ci));
 int client_fd(int ci);
 void client_ignore(int ci, int fd);
 void client_back(int ci, int fd);
-struct lockspace *find_ls(char *name);
+struct lockspace *find_ls(const char *name);
 struct lockspace *find_ls_id(uint32_t id);
 const char *dlm_mode_str(int mode);
 void cluster_dead(int ci);
diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 2c534a1e..31489d54 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -537,7 +537,7 @@ static int check_run_operation(char *uuid_str, uint32_t flags, struct dlmc_run_c
 	return 0;
 }
 
-static struct lockspace *create_ls(char *name)
+static struct lockspace *create_ls(const char *name)
 {
 	struct lockspace *ls;
 
@@ -562,7 +562,7 @@ static struct lockspace *create_ls(char *name)
 	return ls;
 }
 
-struct lockspace *find_ls(char *name)
+struct lockspace *find_ls(const char *name)
 {
 	struct lockspace *ls;
 
-- 
2.31.1

