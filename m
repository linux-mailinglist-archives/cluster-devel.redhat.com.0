Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD855BF54
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 10:03:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-1mFNURPoNVCGExhoup6q3Q-1; Tue, 28 Jun 2022 04:03:41 -0400
X-MC-Unique: 1mFNURPoNVCGExhoup6q3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EF871C08966;
	Tue, 28 Jun 2022 08:03:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 819FC40CF916;
	Tue, 28 Jun 2022 08:03:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 39EA91947052;
	Tue, 28 Jun 2022 08:03:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8014A194704D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 06:10:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E0FA20296A2; Tue, 28 Jun 2022 06:10:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A2F42026D64
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 06:10:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5205C185A79C
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 06:10:48 +0000 (UTC)
Received: from hust.edu.cn (hust.edu.cn [202.114.0.240]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-sIj0tDMFMy2u0lmBZMbgZw-1; Tue, 28 Jun 2022 02:10:43 -0400
X-MC-Unique: sIj0tDMFMy2u0lmBZMbgZw-1
Received: from localhost.localdomain ([172.16.0.254])
 (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
 by mx1.hust.edu.cn  with ESMTP id 25S605dn024527-25S605dq024527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 28 Jun 2022 14:00:10 +0800
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Steven Whitehouse <swhiteho@redhat.com>, Jean Delvare <khali@linux-fr.org>
Date: Tue, 28 Jun 2022 13:59:48 +0800
Message-Id: <20220628055949.566089-1-dzm91@hust.edu.cn>
MIME-Version: 1.0
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Tue, 28 Jun 2022 08:03:37 +0000
Subject: [Cluster-devel] [PATCH] gfs2: fix overread in the strlcpy of
 init_names
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
Cc: cluster-devel@redhat.com, syzkaller <syzkaller@googlegroups.com>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Dongliang Mu <mudongliangabcd@gmail.com>

In init_names, strlcpy will overread the src string as the src string is
less than GFS2_FSNAME_LEN(256).

Fix this by modifying strlcpy back to snprintf, reverting
the commit 00377d8e3842.

Fixes: 00377d8e3842 ("[GFS2] Prefer strlcpy() over snprintf()")
Reported-by: syzkaller <syzkaller@googlegroups.com>
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/gfs2/ops_fstype.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index c9b423c874a3..ee29b50d39b9 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -383,8 +383,8 @@ static int init_names(struct gfs2_sbd *sdp, int silent)
 	if (!table[0])
 		table = sdp->sd_vfs->s_id;
 
-	strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
-	strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
+	snprintf(sdp->sd_proto_name, GFS2_FSNAME_LEN, "%s", proto);
+	snprintf(sdp->sd_table_name, GFS2_FSNAME_LEN, "%s", table);
 
 	table = sdp->sd_table_name;
 	while ((table = strchr(table, '/')))
-- 
2.35.1

