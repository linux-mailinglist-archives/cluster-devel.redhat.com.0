Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44B5606F7
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:06:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656522368;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r9SPhfylipE/9vbcPhtruiF9+Zsfqub1lp5v6rk8ajo=;
	b=RviqpErj1jFryix2SSJpJHgb+2Jbu8WMjZOncR2xq9KoY/7RuexPqdO6lG3o8Pcc9Uuf6e
	/LIxAwCdUrFeWnPReoihSw81ZN9NGKxH/8Gc3m8oKQntO+D9QdBqNVwGfRJBuwm8aHptSS
	9zHaACMRGVsm0I1FraxPqxsGb/EqkjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-fRaLm9HxPTe8QSgcs7ajwg-1; Wed, 29 Jun 2022 13:06:04 -0400
X-MC-Unique: fRaLm9HxPTe8QSgcs7ajwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11AFE85A581;
	Wed, 29 Jun 2022 17:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 055DCC28118;
	Wed, 29 Jun 2022 17:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C5481947068;
	Wed, 29 Jun 2022 17:06:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BC58B1947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A04DC492CA4; Wed, 29 Jun 2022 16:37:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1E6492C3B;
 Wed, 29 Jun 2022 16:37:18 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:10 +0200
Message-Id: <20220629163711.732931-9-agruenba@redhat.com>
In-Reply-To: <20220629163711.732931-1-agruenba@redhat.com>
References: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 8/9] gfs2: List traversal in do_promote is
 safe
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In do_promote(), we're never removing the current entry from the list
and so the list traversal is actually safe.  Switch back to
list_for_each_entry().

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 2138460a7369..e79f17d6d001 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -534,11 +534,11 @@ int gfs2_instantiate(struct gfs2_holder *gh)
 
 static int do_promote(struct gfs2_glock *gl)
 {
-	struct gfs2_holder *gh, *tmp, *current_gh;
+	struct gfs2_holder *gh, *current_gh;
 	bool incompat_holders_demoted = false;
 
 	current_gh = find_first_strong_holder(gl);
-	list_for_each_entry_safe(gh, tmp, &gl->gl_holders, gh_list) {
+	list_for_each_entry(gh, &gl->gl_holders, gh_list) {
 		if (test_bit(HIF_HOLDER, &gh->gh_iflags))
 			continue;
 		if (!may_grant(gl, current_gh, gh)) {
-- 
2.35.1

