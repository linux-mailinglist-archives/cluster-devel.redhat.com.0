Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA244C6BC
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Nov 2021 19:18:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636568284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MDB0mUNjBlqZoi/Uzfc93Xqt1qGTzu1ZFEJlZCKC0kA=;
	b=TO8oK8ot+9eoWqi/HQwOWsYMfXd3Irs2a7A0XoezJAWJGS6cN8LICdqWBIxKqFuK0rHZ32
	PIGNDhv2c18Mid3QAGRduSa477NtkJ/nYNsHj2Le8eejvsmHgzwMcoOnINFnWd4E6YpJr/
	7+K8pA9izGtOOKxgmQA8VZYelKEtZ8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-kAqrtt35MJ6P68slLl-mFA-1; Wed, 10 Nov 2021 13:18:01 -0500
X-MC-Unique: kAqrtt35MJ6P68slLl-mFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D82451926DA0;
	Wed, 10 Nov 2021 18:17:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8AFB5E278;
	Wed, 10 Nov 2021 18:17:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDEEC4EA2A;
	Wed, 10 Nov 2021 18:17:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AAHxMAA032343 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 12:59:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 60EC2608BA; Wed, 10 Nov 2021 17:59:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.195.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDF160936;
	Wed, 10 Nov 2021 17:59:21 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 10 Nov 2021 18:59:15 +0100
Message-Id: <20211110175915.534759-5-agruenba@redhat.com>
In-Reply-To: <20211110175915.534759-1-agruenba@redhat.com>
References: <20211110175915.534759-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Cluster-devel] [PATCH 5/5] gfs2: Fix "Introduce flag for glock
	holder auto-demotion"
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Function demote_incompat_holders iterates over the list of glock holders
with list_for_each_entry, and it then sometimes removes the current
holder from the list.  This will get the loop stuck; we must use
list_for_each_entry_safe instead.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 258d8aae7c53..8dbd6fe66420 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -411,14 +411,14 @@ static void do_error(struct gfs2_glock *gl, const int ret)
 static void demote_incompat_holders(struct gfs2_glock *gl,
 				    struct gfs2_holder *new_gh)
 {
-	struct gfs2_holder *gh;
+	struct gfs2_holder *gh, *tmp;
 
 	/*
 	 * Demote incompatible holders before we make ourselves eligible.
 	 * (This holder may or may not allow auto-demoting, but we don't want
 	 * to demote the new holder before it's even granted.)
 	 */
-	list_for_each_entry(gh, &gl->gl_holders, gh_list) {
+	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
 		/*
 		 * Since holders are at the front of the list, we stop when we
 		 * find the first non-holder.
-- 
2.31.1

