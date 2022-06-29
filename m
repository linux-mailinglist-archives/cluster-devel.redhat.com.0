Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB87560712
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l36nkCdWG7nERgVIxL8gPcrMbmPGc7NbGuFSPAuO0s4=;
	b=h3aqQemaQNZhJXHs5uqZonw/0uI4synwR9BaHtVy1NM3ZnFuRuqc1CF1ySAePvkIM5qJUo
	2x9nJoexWsN8fg/bAGyTAM4JvX8D13cEOv4aMS0P+vuhg1LCeORa7jroLbevW771px8SVl
	DjDA9FIu5dCgtE1nsxkWMrw+6P4qZt4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-Ns4SmmikNRa4IMxr48RdsQ-1; Wed, 29 Jun 2022 13:11:45 -0400
X-MC-Unique: Ns4SmmikNRa4IMxr48RdsQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6225E3C0F389;
	Wed, 29 Jun 2022 17:11:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5753F492C3B;
	Wed, 29 Jun 2022 17:11:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E28C31947060;
	Wed, 29 Jun 2022 17:11:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A6011947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DFD21492CA3; Wed, 29 Jun 2022 16:37:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6B7492C3B;
 Wed, 29 Jun 2022 16:37:17 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:08 +0200
Message-Id: <20220629163711.732931-7-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 6/9] gfs2: Use better variable name
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In do_promote() and add_to_queue(), use current_gh as the variable name
for the first strong holder we could find: this matches the variable
name is may_grant(), and more clearly indicates that we're interested in
one (any) of the current strong holders.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 832af9a03b15..27b519099579 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -529,14 +529,14 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 
 static int do_promote(struct gfs2_glock *gl)
 {
-	struct gfs2_holder *gh, *tmp, *first_gh;
+	struct gfs2_holder *gh, *tmp, *current_gh;
 	bool incompat_holders_demoted = false;
 
-	first_gh = find_first_strong_holder(gl);
+	current_gh = find_first_strong_holder(gl);
 	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
-		if (!may_grant(gl, first_gh, gh)) {
+		if (!may_grant(gl, current_gh, gh)) {
 			/*
 			 * If we get here, it means we may not grant this holder for
 			 * some reason. If this holder is the head of the list, it
@@ -548,9 +548,9 @@ static int do_promote(struct gfs2_glock *gl)
 			break;
 		}
 		if (!incompat_holders_demoted) {
-			demote_incompat_holders(gl, first_gh);
+			demote_incompat_holders(gl, current_gh);
 			incompat_holders_demoted = true;
-			first_gh = gh;
+			current_gh = gh;
 		}
 		set_bit(HIF_HOLDER, &gh->gh_iflags);
 		trace_gfs2_promote(gh);
@@ -1456,10 +1456,10 @@ __acquires(&gl->gl_lockref.lock)
 
 	if (gh->gh_flags & (LM_FLAG_TRY | LM_FLAG_TRY_1CB)) {
 		if (test_bit(GLF_LOCK, &gl->gl_flags)) {
-			struct gfs2_holder *first_gh;
+			struct gfs2_holder *current_gh;
 
-			first_gh = find_first_strong_holder(gl);
-			try_futile = !may_grant(gl, first_gh, gh);
+			current_gh = find_first_strong_holder(gl);
+			try_futile = !may_grant(gl, current_gh, gh);
 		}
 		if (test_bit(GLF_INVALIDATE_IN_PROGRESS, &gl->gl_flags))
 			goto fail;
-- 
2.35.1

