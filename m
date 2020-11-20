Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8292BB292
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Nov 2020 19:25:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-8rOUyTx9MWeudB8tDOkITQ-1; Fri, 20 Nov 2020 13:25:17 -0500
X-MC-Unique: 8rOUyTx9MWeudB8tDOkITQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1075C8042BD;
	Fri, 20 Nov 2020 18:25:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C28D25D9D0;
	Fri, 20 Nov 2020 18:25:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 263934BB7B;
	Fri, 20 Nov 2020 18:25:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKIP4SV012286 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 13:25:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 192162026D13; Fri, 20 Nov 2020 18:25:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C8B2026D76
	for <cluster-devel@redhat.com>; Fri, 20 Nov 2020 18:25:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E2C103B800
	for <cluster-devel@redhat.com>; Fri, 20 Nov 2020 18:25:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-73-_I-dNuSuM32dBTg1U5qjfw-1; 
	Fri, 20 Nov 2020 13:24:59 -0500
X-MC-Unique: _I-dNuSuM32dBTg1U5qjfw-1
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D735C22D0A;
	Fri, 20 Nov 2020 18:24:56 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:25:03 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <84d07c8510abf95c9e656454961c09b14485b856.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [Cluster-devel] [PATCH 006/141] gfs2: Fix fall-through warnings for
	Clang
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding multiple goto statements instead of just
letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/gfs2/inode.c    | 2 ++
 fs/gfs2/recovery.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index 077ccb1b3ccc..9a85214c2505 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -960,6 +960,7 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
 		break;
 	case 0:
 		error = -EEXIST;
+		goto out_gunlock;
 	default:
 		goto out_gunlock;
 	}
@@ -1500,6 +1501,7 @@ static int gfs2_rename(struct inode *odir, struct dentry *odentry,
 			break;
 		case 0:
 			error = -EEXIST;
+			goto out_gunlock;
 		default:
 			goto out_gunlock;
 		}
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index c26c68ebd29d..5b2a01d9c463 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -437,6 +437,7 @@ void gfs2_recover_func(struct work_struct *work)
 		case GLR_TRYFAILED:
 			fs_info(sdp, "jid=%u: Busy\n", jd->jd_jid);
 			error = 0;
+			goto fail;
 
 		default:
 			goto fail;
-- 
2.27.0

