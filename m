Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEBD2C6BDA
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Nov 2020 20:12:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606504360;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:content-type:content-type:list-id:
	 list-help:list-unsubscribe:list-subscribe:list-post;
	bh=/OfSRiSdXUFrNn7G7mwPl2JALGJnETCzdil67iB91AE=;
	b=iXCCE604woqsP/9Zdd0mEX4+gxqWoN48rxL9Hujo7FYeXcBY7AhWaqtQkFxqIT8V6DW6k0
	+pR23u4MjCBpEFxS38NGTu2g6CvKQnvALHDyvjqoytofhzB8K8RTpQJTcCPPUE3qg20jCu
	iqKLAJdcgIWwmilQiKhei3Vb38h5FbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-_5bcigKRNWikTPnSpx9z4g-1; Fri, 27 Nov 2020 14:12:38 -0500
X-MC-Unique: _5bcigKRNWikTPnSpx9z4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FC1B3FD0;
	Fri, 27 Nov 2020 19:12:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 461185D6D1;
	Fri, 27 Nov 2020 19:12:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82CD34BB7B;
	Fri, 27 Nov 2020 19:12:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARJCKEa024295 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 14:12:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA2D8100320D; Fri, 27 Nov 2020 19:12:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A58BB1007A54
	for <cluster-devel@redhat.com>; Fri, 27 Nov 2020 19:12:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54AEB811E76
	for <cluster-devel@redhat.com>; Fri, 27 Nov 2020 19:12:18 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-249-U8wQcnCOMSmm8ghlafQkPg-1; Fri, 27 Nov 2020 14:12:16 -0500
X-MC-Unique: U8wQcnCOMSmm8ghlafQkPg-1
Received: by mail-qv1-f72.google.com with SMTP id l15so3555841qvu.8
	for <cluster-devel@redhat.com>; Fri, 27 Nov 2020 11:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/OfSRiSdXUFrNn7G7mwPl2JALGJnETCzdil67iB91AE=;
	b=Leg831K8jZ478QaR09a0W90N2spykEZTUJsy9yB0WNwJzn5mrSGcoPPCP1Eqn1BRkp
	3Kk0XZ9Tpmw514OhJmxfDfSBhc19M5cxdxqwvnHpQ5+g2JNcxOvNw67IKA+dHF6qHQDe
	l9PWh6qgmUfWGrzk38ngVT1/NroLsDowOee8R+tLqxv/s3r5VOYuBbpVOKNDcma2f7Wg
	m1xw+ivDpgfmAXjgOHBk2K14AhUnA1yxlt6K2tVkFPDHkeO1pRJ2vpHYbGil1ncFskq/
	felEAukCLVdhb+i5Fr27jm6tgpj99pOFMuclbAhSrSpEX9zHute3/wE5Ki9cZAMDlfxe
	8H2w==
X-Gm-Message-State: AOAM530zCP1kx8Ew+XY9ywIWCVt+6xnJ744irTudG/eflIcHFPTZ03Vp
	G51OgF4iPtZj5rJlxuvcl9XYLeWgphxa9aFhqvflOr0HkvdgzcGB1gpdbj69Dj+KgEEoITRx7Qu
	MFheBPi53ecBb88PGQxEHFg==
X-Received: by 2002:a05:620a:11ad:: with SMTP id
	c13mr10107612qkk.399.1606504335595; 
	Fri, 27 Nov 2020 11:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTxu7hFBg6fRSAhPiAUlYAUojVzSfjok+SdyqO5ystGrlFnNwWp/2495RDw2iPRZv78PWATg==
X-Received: by 2002:a05:620a:11ad:: with SMTP id
	c13mr10107591qkk.399.1606504335419; 
	Fri, 27 Nov 2020 11:12:15 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
	[75.142.250.213])
	by smtp.gmail.com with ESMTPSA id i9sm6688165qtp.72.2020.11.27.11.12.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Nov 2020 11:12:14 -0800 (PST)
From: trix@redhat.com
To: rpeterso@redhat.com, agruenba@redhat.com
Date: Fri, 27 Nov 2020 11:12:09 -0800
Message-Id: <20201127191209.2850758-1-trix@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: remove trailing semicolon in macro
	definition
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/gfs2/util.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index d7562981b3a0..493020393ceb 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -162,7 +162,7 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct buffer_head *bh,
 gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, true);
 
 #define gfs2_io_error_bh(sdp, bh) \
-gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, false);
+gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, false)
 
 
 extern struct kmem_cache *gfs2_glock_cachep;
-- 
2.18.4

