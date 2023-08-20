Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A6781C7A
	for <lists+cluster-devel@lfdr.de>; Sun, 20 Aug 2023 07:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692507965;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5i3MeWSPR32t1wIPXkNJpQxP65sGqKoFt0d5k586/Wg=;
	b=B2ATmEOBXD5KpNxHzwUY0kHjGfael+QuOiUAT887WLrX9aUMimTkvtT1CfatTi+63YP3TL
	Q8/98F0CZPrOSZ5dWcBAFhbLSF8t7/tGPddAYlhJqoUAOzaE0dubVZKGfbXBiQikvB4jlQ
	w+AMXTIcIgLOY6Be10KXM+1Yq9/Rn6w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-hFgSvcyzMWqv5n1AJNdnmA-1; Sun, 20 Aug 2023 01:06:02 -0400
X-MC-Unique: hFgSvcyzMWqv5n1AJNdnmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 498258007A4;
	Sun, 20 Aug 2023 05:06:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F413140E950;
	Sun, 20 Aug 2023 05:05:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5D83F194658C;
	Sun, 20 Aug 2023 05:05:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C60061946587 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 20 Aug 2023 05:05:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AFA67C15BAE; Sun, 20 Aug 2023 05:05:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A77E3C15BAD
 for <cluster-devel@redhat.com>; Sun, 20 Aug 2023 05:05:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 533743C0C487
 for <cluster-devel@redhat.com>; Sun, 20 Aug 2023 05:05:54 +0000 (UTC)
Received: from mail3-163.sinamail.sina.com.cn
 (mail3-163.sinamail.sina.com.cn [202.108.3.163]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-zyrE4XTFMgGYdFVBqD1Q7Q-1; Sun, 20 Aug 2023 01:05:51 -0400
X-MC-Unique: zyrE4XTFMgGYdFVBqD1Q7Q-1
X-SMAIL-HELO: pek-lxu-l1.wrs.com
Received: from unknown (HELO pek-lxu-l1.wrs.com)([111.198.228.11])
 by sina.com (172.16.97.27) with ESMTP
 id 64E19EEA0002ED98; Sun, 20 Aug 2023 13:04:44 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 829847786919
X-SMAIL-UIID: D67557D4E65F45B9BA1BD61341870CD0-20230820-130444
From: eadavis@sina.com
To: agruenba@redhat.com
Date: Sun, 20 Aug 2023 13:04:41 +0800
Message-ID: <20230820050441.793632-1-eadavis@sina.com>
In-Reply-To: <CAHc6FU7jmjG7wkBHNiQ8J-=89U6pa6SMvJj60hX-WL-cSq9R-w@mail.gmail.com>
References: <CAHc6FU7jmjG7wkBHNiQ8J-=89U6pa6SMvJj60hX-WL-cSq9R-w@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH] gfs2: Fix uaf for qda in gfs2_quota_sync
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
Cc: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com,
 eadaivs <eadaivs@sina.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: sina.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: eadaivs <eadaivs@sina.com>

Hello Andreas,

On Mon, 30 Jan 2023 15:32:42 +0100  <agruenba@redhat.com> wrote:
> I can see that there is a problem in the gfs2 quota code, but this
> unfortunately doesn't look like an acceptable fix. A better approach
> would be to use proper reference counting for gfs2_quota_data objects.
> In this case, gfs2_quota_sync() is still holding a reference, so the
> underlying object shouldn't be freed.
> 
> Fixing this properly will require more than a handful of lines.

Before clearing quota, wait for the qd synchronization operation to end.
Add reference count in gfs2_quota_data and perform qd synchronization 
to control whether qd is in use. If so, temporarily clear quota.

Link: https://lore.kernel.org/all/0000000000002b5e2405f14e860f@google.com
Reported-and-tested-by: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
Signed-off-by: eadaivs <eadaivs@sina.com>
---
 fs/gfs2/incore.h |  1 +
 fs/gfs2/quota.c  | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index c26765080f28..61549bd95b32 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -463,6 +463,7 @@ struct gfs2_quota_data {
 	u64 qd_sync_gen;
 	unsigned long qd_last_warn;
 	struct rcu_head qd_rcu;
+	unsigned int ref_cnt;
 };
 
 enum {
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 1ed17226d9ed..dca4be078ce8 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -478,6 +478,7 @@ static int qd_fish(struct gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
 			qd_put(qd);
 			return error;
 		}
+		WRITE_ONCE(qd->ref_cnt, READ_ONCE(qd->ref_cnt) + 1);
 	}
 
 	*qdp = qd;
@@ -493,6 +494,7 @@ static void qd_unlock(struct gfs2_quota_data *qd)
 	bh_put(qd);
 	slot_put(qd);
 	qd_put(qd);
+	WRITE_ONCE(qd->ref_cnt, READ_ONCE(qd->ref_cnt) - 1);
 }
 
 static int qdsb_get(struct gfs2_sbd *sdp, struct kqid qid,
@@ -1422,6 +1424,7 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 			qd->qd_change = qc_change;
 			qd->qd_slot = slot;
 			qd->qd_slot_count = 1;
+			WRITE_ONCE(qd->ref_cnt, 0);
 
 			spin_lock(&qd_lock);
 			BUG_ON(test_and_set_bit(slot, sdp->sd_quota_bitmap));
@@ -1454,11 +1457,13 @@ int gfs2_quota_init(struct gfs2_sbd *sdp)
 void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 {
 	struct list_head *head = &sdp->sd_quota_list;
-	struct gfs2_quota_data *qd;
+	struct gfs2_quota_data *qd, *safe;
 
+retry:
 	spin_lock(&qd_lock);
-	while (!list_empty(head)) {
-		qd = list_last_entry(head, struct gfs2_quota_data, qd_list);
+	list_for_each_entry_safe(qd, safe, head, qd_list) {
+		if (READ_ONCE(qd->ref_cnt))
+			continue;
 
 		list_del(&qd->qd_list);
 
@@ -1482,7 +1487,10 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 	}
 	spin_unlock(&qd_lock);
 
-	gfs2_assert_warn(sdp, !atomic_read(&sdp->sd_quota_count));
+	if (atomic_read(&sdp->sd_quota_count)) {
+		schedule_timeout_uninterruptible(HZ);
+		goto retry;
+	}
 
 	kvfree(sdp->sd_quota_bitmap);
 	sdp->sd_quota_bitmap = NULL;
-- 
2.41.0

