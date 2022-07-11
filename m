Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4456FEDD
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 12:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657535275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sxcej8iLaxk6KCtDFxQeEdx04v8nRpskZBg7onOm+l0=;
	b=PG43TTfdT5DfdFHs9mlyU/Ev2qIFlIwb6TNOjbx5bqO2yfI95q0vxpn8QopiGVNCvIVIn2
	Rd9hhbwn6HFxIzUXyOM1YFYUT7UUQG3VRXgR8fGbFaQuZtG7l4kmQIbMpBbB1x3spfUDtg
	6Pw8uP7K2y1hlNSRGBj6wUUSFZrDoNg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-p8qi8cnpOa2q-JpSgZn9PA-1; Mon, 11 Jul 2022 06:27:53 -0400
X-MC-Unique: p8qi8cnpOa2q-JpSgZn9PA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4179811E9B;
	Mon, 11 Jul 2022 10:27:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 156D9401473;
	Mon, 11 Jul 2022 10:27:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B45811947055;
	Mon, 11 Jul 2022 10:27:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D03F1194704A for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 10:27:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD0292026D07; Mon, 11 Jul 2022 10:27:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from nux.com (unknown [10.40.192.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B6EA2026D64;
 Mon, 11 Jul 2022 10:27:47 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Mon, 11 Jul 2022 12:27:47 +0200
Message-Id: <20220711102747.359525-1-agruenba@redhat.com>
In-Reply-To: <20220711041459.1062583-2-hch@lst.de>
References: <20220711041459.1062583-2-hch@lst.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 1/4] gfs2: stop using generic_writepages
 in gfs2_ail1_start_one
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hello,

On Mon, Jul 11, 2022 at 7:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use filemap_fdatawrite_wbc instead of generic_writepages in
> gfs2_ail1_start_one so that the functin can also cope with address_space
> operations that only implement ->writepages and to properly account
> for cgroup writeback.

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

I assume you want to push this through the xfs tree.

Can you add the below follow-up cleanup?

Thanks,
Andreas

---
 fs/gfs2/log.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 624dffc96136..7fc6cb95dec8 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -222,8 +222,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	spin_unlock(&sdp->sd_ail_lock);
 	blk_finish_plug(&plug);
 	if (ret) {
-		gfs2_lm(sdp, "gfs2_ail1_start_one (generic_writepages) "
-			"returned: %d\n", ret);
+		gfs2_lm(sdp, "gfs2_ail1_start_one returned %d\n", ret);
 		gfs2_withdraw(sdp);
 	}
 	trace_gfs2_ail_flush(sdp, wbc, 0);
-- 
2.36.1

