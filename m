Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC904D5DF5
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Mar 2022 09:58:35 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-IWRBzAWVNt-cmx1N5tNgkQ-1; Fri, 11 Mar 2022 03:58:32 -0500
X-MC-Unique: IWRBzAWVNt-cmx1N5tNgkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27671185A7A4;
	Fri, 11 Mar 2022 08:58:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 186FDC07F53;
	Fri, 11 Mar 2022 08:58:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B65771940349;
	Fri, 11 Mar 2022 08:58:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3898B1949762 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 11 Mar 2022 08:44:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 23A1A2166B2F; Fri, 11 Mar 2022 08:44:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F73A2166B26
 for <cluster-devel@redhat.com>; Fri, 11 Mar 2022 08:44:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA8C6801585
 for <cluster-devel@redhat.com>; Fri, 11 Mar 2022 08:44:25 +0000 (UTC)
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23]) by
 relay.mimecast.com with ESMTP id us-mta-398-kz4GAj5dO1Gy7gzyHF65Rw-1; Fri,
 11 Mar 2022 03:44:21 -0500
X-MC-Unique: kz4GAj5dO1Gy7gzyHF65Rw-1
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-03 (Coremail) with SMTP id rQCowACnx5gBCitimT5sAg--.54677S2;
 Fri, 11 Mar 2022 16:36:18 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Date: Fri, 11 Mar 2022 16:36:16 +0800
Message-Id: <20220311083616.2213689-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACnx5gBCitimT5sAg--.54677S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur4rZr4fJF13Ar4fGF1kAFb_yoWxKwc_Ca
 n7ZFsxCw45JF9YkF18A3yIyrnYk3y5uF1fWFs3K3sxGas5ta47J34jkw15Ar4DGFZ0grnx
 G34qya9xZ3WxWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Fri, 11 Mar 2022 08:58:03 +0000
Subject: [Cluster-devel] [PATCH] gfs2: Add check for mempool_alloc
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
Cc: cluster-devel@redhat.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

As the potential failure of mempool_alloc(),
it could return NULL pointer.
Therefore, it should be better to check it
in order to avoid the dereference of the NULL
pointer.

Fixes: e8c92ed76900 ("GFS2: Clean up log write code path")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 fs/gfs2/log.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index f0ee3ff6f9a8..10dd09e9b0e4 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -837,6 +837,9 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct gfs2_jdesc *jd,
 		return;
 
 	page = mempool_alloc(gfs2_page_pool, GFP_NOIO);
+	if (!page)
+		return;
+
 	lh = page_address(page);
 	clear_page(lh);
 
-- 
2.25.1

