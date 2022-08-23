Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D962559D2B1
	for <lists+cluster-devel@lfdr.de>; Tue, 23 Aug 2022 09:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661241286;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Fhc6O7Qq+zYM2J7HupUPMiHA1uhYp0JcTthm4gtLpMk=;
	b=L3xmuxsLn4N+Z6e5sBaQ/haExlBxWrFDzva/AElraMzXrIrwHeUTkV3NEw5zRe40RiPYKX
	ZqEMCGTNiw72G+Z3QrmZ18QEY1JliSDvBu4bGywKpFWAA8Pki4N9f7tyu0j84wauWDmIjV
	f9aWZLhK6TbKbCXLxx9ha4eoiwMommo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-cTFvKuoTMdCntWF2v9P_Aw-1; Tue, 23 Aug 2022 03:54:43 -0400
X-MC-Unique: cTFvKuoTMdCntWF2v9P_Aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AAC629DD982;
	Tue, 23 Aug 2022 07:54:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CA8A1121315;
	Tue, 23 Aug 2022 07:54:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF3301946A58;
	Tue, 23 Aug 2022 07:54:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE74A1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 Aug 2022 07:54:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEBBE492CA4; Tue, 23 Aug 2022 07:54:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC7C492C3B
 for <cluster-devel@redhat.com>; Tue, 23 Aug 2022 07:54:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3AE038149A9
 for <cluster-devel@redhat.com>; Tue, 23 Aug 2022 07:54:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-zU5KhBSHMNWTe3XzBln5xg-1; Tue, 23 Aug 2022 03:54:34 -0400
X-MC-Unique: zU5KhBSHMNWTe3XzBln5xg-1
Received: by mail-pf1-f169.google.com with SMTP id y141so12717778pfb.7;
 Tue, 23 Aug 2022 00:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Fhc6O7Qq+zYM2J7HupUPMiHA1uhYp0JcTthm4gtLpMk=;
 b=BnaIIQwhHO0GqsDMVNTHtaI9TZKgQhZwECBe9fBGOOVl5bRsuGU/Ydjy6RP5Y0MsWC
 C0k5KvXUm1zj9ZqyXP6b0oVxkgIWz7Tis6R2ZHv/kUVPE1OIO9BcfqtYdNcX+qgMDI4X
 wQyedaHFfV9o7s85lmv5DcMecL1W2zODem6u4pGvQVeVFpt9FNwho6CEXVmAFCz6FioT
 zo9aC4AN8e7SgTR1AVI+NbFPnoLf0zR04TR+2nBCUSwaEVqqKpS7Zd3rnDRUDL8ikC4U
 tMu2PcdMJc2LH8zKLHME9+gKSQ5LAdye5M4rIAbuZgPAuVzEcURfx7hdJulKmlRm+pdV
 DXMA==
X-Gm-Message-State: ACgBeo3CyycfFETeMYhg8YafCXrZobsUxx4SO4VoIV8egbjn0ombKdby
 R1ilJBNLJW+LXb7aEj6OOKiC0cIPpFM=
X-Google-Smtp-Source: AA6agR42r5dO1/gViA+AZieihQ4hhf5LzL7oacVP6Vd1GQ+y1OSyfKOBE2bT0T+YxAX1ZqxCr6apSQ==
X-Received: by 2002:a05:6a00:1410:b0:528:5a5a:d846 with SMTP id
 l16-20020a056a00141000b005285a5ad846mr24614330pfu.9.1661241272696; 
 Tue, 23 Aug 2022 00:54:32 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a170902d38c00b001636d95fe59sm4284033pld.172.2022.08.23.00.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 00:54:32 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: agruenba@redhat.com,
	linux-kernel@vger.kernel.org
Date: Tue, 23 Aug 2022 07:54:29 +0000
Message-Id: <20220823075429.209135-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH linux-next] gfs2: Remove the unneeded result
 variable
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
Cc: cluster-devel@redhat.com, Zeal Robot <zealci@zte.com.cn>,
 ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value from gfs2_iomap_get() directly instead of storing it
in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 fs/gfs2/bmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 3bdb2c668a71..977d53db2994 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2462,8 +2462,6 @@ int __gfs2_punch_hole(struct file *file, loff_t offset, loff_t length)
 static int gfs2_map_blocks(struct iomap_writepage_ctx *wpc, struct inode *inode,
 		loff_t offset)
 {
-	int ret;
-
 	if (WARN_ON_ONCE(gfs2_is_stuffed(GFS2_I(inode))))
 		return -EIO;
 
@@ -2472,8 +2470,7 @@ static int gfs2_map_blocks(struct iomap_writepage_ctx *wpc, struct inode *inode,
 		return 0;
 
 	memset(&wpc->iomap, 0, sizeof(wpc->iomap));
-	ret = gfs2_iomap_get(inode, offset, INT_MAX, &wpc->iomap);
-	return ret;
+	return gfs2_iomap_get(inode, offset, INT_MAX, &wpc->iomap);
 }
 
 const struct iomap_writeback_ops gfs2_writeback_ops = {
-- 
2.25.1

