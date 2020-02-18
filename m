Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC571626F4
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 14:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582031649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=srX5oBCM6z4Rdiradg/lp6eUVlaigPn3ftTSiwEX5uY=;
	b=X9wvOc4gWJvDC6EaarbD0ZSN8f8idyb3aI3FsAZhFzPEkwUB49AlH108Yo2/kWLmtoyQPw
	ijeDTlcawb3XLICEaD0TbGGTlLlaPDtaX7PtWdixim6heFfclD3AD3bfDCbkV57BNGeRag
	Gd/7rE+z3lH7z2HwRzbG3INKZxMDSZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-4XXeY-P9M32hTY2UOJJLwQ-1; Tue, 18 Feb 2020 08:14:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B664801A03;
	Tue, 18 Feb 2020 13:14:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8438261A7;
	Tue, 18 Feb 2020 13:14:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21D8035AF1;
	Tue, 18 Feb 2020 13:14:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IDE1r2021685 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 08:14:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8CB6A5C1B2; Tue, 18 Feb 2020 13:14:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F8666846;
	Tue, 18 Feb 2020 13:13:58 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE42918089C8;
	Tue, 18 Feb 2020 13:13:58 +0000 (UTC)
Date: Tue, 18 Feb 2020 08:13:58 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <340949318.9253893.1582031638792.JavaMail.zimbra@redhat.com>
In-Reply-To: <1d1c46b7e86bd0a18d9abbea0de0bc2be84e5e2b.1581955849.git.mchehab+huawei@kernel.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
	<1d1c46b7e86bd0a18d9abbea0de0bc2be84e5e2b.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.36.116.223, 10.4.195.22]
Thread-Topic: docs: filesystems: convert gfs2-uevents.txt to ReST
Thread-Index: fh9CKZQJOdebSJOFTYg6XetmhmQ5Jw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
	Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 20/44] docs: filesystems: convert
 gfs2-uevents.txt to ReST
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4XXeY-P9M32hTY2UOJJLwQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> This document is almost in ReST format: all it needs is to have
> the titles adjusted and add a SPDX header. In other words:
> 
> - Add a SPDX header;
> - Add a document title;
> - Adjust section titles;
> - Add it to filesystems/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Both patches re: gfs2 look good.

Acked-by: Bob Peterson <rpeterso@redhat.com>

