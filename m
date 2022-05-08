Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E63151ECCF
	for <lists+cluster-devel@lfdr.de>; Sun,  8 May 2022 12:06:50 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-jTFpFELoPUWd8tkkSYs6vw-1; Sun, 08 May 2022 06:06:46 -0400
X-MC-Unique: jTFpFELoPUWd8tkkSYs6vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10D171C05EAA;
	Sun,  8 May 2022 10:06:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D0CD2024CB7;
	Sun,  8 May 2022 10:06:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E0504194705D;
	Sun,  8 May 2022 10:06:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1C6D41947042 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 May 2022 10:06:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ACFD6C27E83; Sun,  8 May 2022 10:06:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F1EC27DB8
 for <cluster-devel@redhat.com>; Sun,  8 May 2022 10:06:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ED5F101AA45
 for <cluster-devel@redhat.com>; Sun,  8 May 2022 10:06:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-1-tKhNOLN--e3uJ-AVsJPg-1; Sun, 08 May 2022 06:06:35 -0400
X-MC-Unique: 1-tKhNOLN--e3uJ-AVsJPg-1
Received: by mail-pj1-f53.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so14641918pjq.0
 for <cluster-devel@redhat.com>; Sun, 08 May 2022 03:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkaLJePYyPZfYRnE3vYCNwqas5gjiv8Fw2OTZAyZSTU=;
 b=EhO6sjtArbW644TJTlH5hKzZb/1KS0wf1P9V5tpj7xX1hn4JLP3prGhiY/3O8Dm5pj
 sdAJFGErOlk1PcrJPNHvs6wkHdGeDylP8+jN6Hfmtd1br9dEC0M9p1f5Dn1jydZvnGxm
 s3b1qBd0TiANh/gGB4rpqY7DuGBfsh3MhE785kxYkTNdqDqqMDON3lelgP5GwV4ze2Nl
 Ndyych2h5KX7qgchWU/7+UbOtaMUmcbVxU6l58hROHoPxintb8BwLueA2qHVFfkL8q8e
 7duHHBaqjs1DYJNdsqi9nSUcPKr5phMkKKydxhHFSx3EzFfRxRWrntuvUAEqZpY7FELV
 8g9Q==
X-Gm-Message-State: AOAM533qQL4+SfTPwGA3C6od/N0Xi5JybFjtx1yhvwiwuvWuTo4T5okB
 P/XzyqbF7gIWYcKj8eIQk+AWqg==
X-Google-Smtp-Source: ABdhPJyVC/VMs0K9YmHuiLbSJVevGigliNxeL4wfFf6BuBdcmtu/fPeGr/6rs+1qLq23kmj0WhKSsg==
X-Received: by 2002:a17:90b:11d1:b0:1db:d99f:62cc with SMTP id
 gv17-20020a17090b11d100b001dbd99f62ccmr12962161pjb.200.1652004394407; 
 Sun, 08 May 2022 03:06:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 67-20020a621946000000b0050dc7628190sm6473067pfz.106.2022.05.08.03.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 03:06:34 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Bob Peterson <rpeterso@redhat.com>
Date: Sun,  8 May 2022 03:06:30 -0700
Message-Id: <20220508100630.2642320-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735; h=from:subject;
 bh=FOaCbdpPkuASD3dMupI7kZh1ObuZvCfUVlaQempQE5I=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBid5YmhjmmxY4dlNl3Yg00NpZgETPyQkRbBwdZZYsZ
 P/YqH4GJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYneWJgAKCRCJcvTf3G3AJnvUD/
 0QrCOlhMPuCLn6t5gkSWTHClT8iEbrktkDASTiiV9NsCddMjoYH7HzpwhZS1cTgRUJaJyffjkcT8kU
 ziPsb6jJXrbAGDqoW3ugGOeX8cbpOhxXBRzg1mHvuMS7+bOQBCNYry34jICEZca/3snx0fQ65kwZxl
 PQnUxShhB2TdYgdQhK1Zn4jwQ4yeR0FIVjR3ms9B4l39dOtWi1DUt2xXReRs0/H9Ith/1QQ8+2qojU
 7WE/58EjmKoCh0V6/cNFvouoquNbHEPhf0LCjwv32LZZrRSfKrf6xPUxzwxN8OKOIJx3FAKEzPtn0i
 I3M1o9eKi5E/Di5xUvtA8fkAOrCmORx24xW/ZAWCdPDwPdWnItsqYDR3Kl6fkaN920ayI4zjdnTI/Z
 iJ16yYT2S/2+WtcJI6oRa1w2DlMMaJijb/QYwVAY2KNDTG21AqtBECuFYBB5AHQBa5MHGCwgQqmU8m
 2ckadWoQmueMRVYCO8D2qHX0hzd70qNzBEeczpzF+x1iDJg26KEXeTyy4E+Q+PxlpgidQmBuXJVxeI
 Q7lnrSpF/n+BdGb2znvvZ9JArWh2YMC+31Gb+e+sVts9B8BYC+I+oEaQeLytqjNmH+iOAswRro6inj
 7wAnH6a95h57dIG+qx7dii0hb6Uf38DdRebsVdKBYCGqhPrPj3f3qUqSsyNw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Cluster-devel] [PATCH] gfs2: Use container_of() for
 gfs2_glock(aspace)
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
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, kernel test robot <lkp@intel.com>,
 Bill Wendling <morbo@google.com>, Kees Cook <keescook@chromium.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Clang's structure layout randomization feature gets upset when it sees
struct address_space (which is randomized) cast to struct gfs2_glock.
This is due to seeing the mapping pointer as being treated as an array
of gfs2_glock, rather than "something else, before struct address_space":

In file included from fs/gfs2/acl.c:23:
fs/gfs2/meta_io.h:44:12: error: casting from randomized structure pointer type 'struct address_space *' to 'struct gfs2_glock *'
	return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
		^

Replace the instances of open-coded pointer math with container_of()
usage, and update the allocator to match.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202205041550.naKxwCBj-lkp@intel.com
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Bill Wendling <morbo@google.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
This another fix uncovered by the Clang randstruct series[1], so it'd
probably make more sense to land via my tree. Do you have a preference?
[1] https://lore.kernel.org/all/20220503205503.3054173-1-keescook@chromium.org/
---
 fs/gfs2/glock.h   |  8 +++++++-
 fs/gfs2/main.c    | 10 ++++------
 fs/gfs2/meta_io.h |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 4f8642301801..2607c7d26640 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -138,6 +138,12 @@ struct lm_lockops {
 	const match_table_t *lm_tokens;
 };
 
+/* gfs2_glock_get(), "glock" must be first. */
+struct glock_aspace {
+	struct gfs2_glock	glock;
+	struct address_space	mapping;
+};
+
 extern struct workqueue_struct *gfs2_delete_workqueue;
 static inline struct gfs2_holder *gfs2_glock_is_locked_by_me(struct gfs2_glock *gl)
 {
@@ -180,7 +186,7 @@ static inline int gfs2_glock_is_held_shrd(struct gfs2_glock *gl)
 static inline struct address_space *gfs2_glock2aspace(struct gfs2_glock *gl)
 {
 	if (gl->gl_ops->go_flags & GLOF_ASPACE)
-		return (struct address_space *)(gl + 1);
+		return &(container_of(gl, struct glock_aspace, glock)->mapping);
 	return NULL;
 }
 
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 28d0eb23e18e..984bd60d01db 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -62,11 +62,10 @@ static void gfs2_init_glock_once(void *foo)
 
 static void gfs2_init_gl_aspace_once(void *foo)
 {
-	struct gfs2_glock *gl = foo;
-	struct address_space *mapping = (struct address_space *)(gl + 1);
+	struct glock_aspace *gl_aspace = foo;
 
-	gfs2_init_glock_once(gl);
-	address_space_init_once(mapping);
+	gfs2_init_glock_once(&gl_aspace->glock);
+	address_space_init_once(&gl_aspace->mapping);
 }
 
 /**
@@ -104,8 +103,7 @@ static int __init init_gfs2_fs(void)
 		goto fail_cachep1;
 
 	gfs2_glock_aspace_cachep = kmem_cache_create("gfs2_glock(aspace)",
-					sizeof(struct gfs2_glock) +
-					sizeof(struct address_space),
+					sizeof(struct glock_aspace),
 					0, 0, gfs2_init_gl_aspace_once);
 
 	if (!gfs2_glock_aspace_cachep)
diff --git a/fs/gfs2/meta_io.h b/fs/gfs2/meta_io.h
index 21880d72081a..2e2f88cfb7ad 100644
--- a/fs/gfs2/meta_io.h
+++ b/fs/gfs2/meta_io.h
@@ -41,7 +41,7 @@ static inline struct gfs2_sbd *gfs2_mapping2sbd(struct address_space *mapping)
 {
 	struct inode *inode = mapping->host;
 	if (mapping->a_ops == &gfs2_meta_aops)
-		return (((struct gfs2_glock *)mapping) - 1)->gl_name.ln_sbd;
+		return container_of(mapping, struct glock_aspace, mapping)->glock.gl_name.ln_sbd;
 	else if (mapping->a_ops == &gfs2_rgrp_aops)
 		return container_of(mapping, struct gfs2_sbd, sd_aspace);
 	else
-- 
2.32.0

