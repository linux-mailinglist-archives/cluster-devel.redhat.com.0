Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4162C6C8E
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Nov 2020 21:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606509057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tglFuF875GWwN24HhSrupHcDE+HNcJd+ysCQTBH59Oo=;
	b=Hg3p/+s+q076i7gpA4nq77/4q35rx1kAbwq172WdparqdfQkA3viHEn+ISty/7AR82F0cZ
	VybVOlMNQ+sb6qpJX9UFz9ZpZNp5vvwLuEbgxh0U8y3fd/cvQBAxYPD28R6WmVx0mI3gGB
	w1fANoWVjf/5lqRg+wWScK0alpmoCQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-x4hbnIiFOsGYF_1g5GiTTA-1; Fri, 27 Nov 2020 15:30:55 -0500
X-MC-Unique: x4hbnIiFOsGYF_1g5GiTTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 917D8800461;
	Fri, 27 Nov 2020 20:30:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 232EE5D9E2;
	Fri, 27 Nov 2020 20:30:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E16704BB7B;
	Fri, 27 Nov 2020 20:30:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARKUfil032387 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 15:30:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EAFABC77D9; Fri, 27 Nov 2020 20:30:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E551CD74AE
	for <cluster-devel@redhat.com>; Fri, 27 Nov 2020 20:30:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77C64185A794
	for <cluster-devel@redhat.com>; Fri, 27 Nov 2020 20:30:38 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-593-_v50clJsPjGno0bXPvW60A-1; Fri, 27 Nov 2020 15:30:36 -0500
X-MC-Unique: _v50clJsPjGno0bXPvW60A-1
Received: by mail-wm1-f70.google.com with SMTP id k23so3558140wmj.1
	for <cluster-devel@redhat.com>; Fri, 27 Nov 2020 12:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tglFuF875GWwN24HhSrupHcDE+HNcJd+ysCQTBH59Oo=;
	b=oPpsphXozIFj7g+Qdp+Zx7tSgTRjQZW1bCDb6nlPn4sQRiPzstItiZfcAJJkVKT8fJ
	EFDpvjXZItZH3x8BQx0X9RTbaOd16bj0rzdaDVAjM5tM+EP6A3gv4DhsO+Ge/SR77QD5
	BSA7gBnJ8yDo0zpEo/BlySgENbaEDUE9y9MY+7wnLpR6h1i9JVFuk3FlT0S4iybuujJD
	Umh3NLrsd2Bd+B8ggERSWeQPpTEGgPAS85/z7PjAuVv+vRNdTw5nmbGVg8d0UZy91sG4
	lwAT0PY6DE/BfF3fbRbR7FKZksDyqXXtYZO2zS9DLwGs2ARbCNcdXzS+4dc4EGjDBzKv
	xj7g==
X-Gm-Message-State: AOAM530o4fqJX/TOZJQexR3jJmk14d0/AUJaeSUmmhJVLiw3HIlSLmLW
	Pdeq8nt98xbzSlI9Tuu1sJrk6I7peMfieUeWIZrrbPiu8lRjHfzFCEni2wPIje0YFvc2xjgTJ2V
	wLABDniFXyihfZFdtbDIf1Jl9+yFijcRsm2r95Q==
X-Received: by 2002:a1c:810c:: with SMTP id c12mr10983379wmd.96.1606509035023; 
	Fri, 27 Nov 2020 12:30:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGlJj2B75JR2lX+fXCp5ap99UGZGXWUoXauI1HGlhqeCKz3FoiXIIgqe5JDWD+P9hEEiFMiBooAHIw60sUGWs=
X-Received: by 2002:a1c:810c:: with SMTP id c12mr10983365wmd.96.1606509034803; 
	Fri, 27 Nov 2020 12:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20201127191209.2850758-1-trix@redhat.com>
In-Reply-To: <20201127191209.2850758-1-trix@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 27 Nov 2020 21:30:23 +0100
Message-ID: <CAHc6FU51+xn3P1SeU-=n3dV2J2XcwEMJp0f7iTee-X3u0TJK4A@mail.gmail.com>
To: trix@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: remove trailing semicolon in
	macro definition
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
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 8:12 PM <trix@redhat.com> wrote:
> From: Tom Rix <trix@redhat.com>
>
> The macro use will already have a semicolon.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  fs/gfs2/util.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
> index d7562981b3a0..493020393ceb 100644
> --- a/fs/gfs2/util.h
> +++ b/fs/gfs2/util.h
> @@ -162,7 +162,7 @@ void gfs2_io_error_bh_i(struct gfs2_sbd *sdp, struct buffer_head *bh,
>  gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, true);
>
>  #define gfs2_io_error_bh(sdp, bh) \
> -gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, false);
> +gfs2_io_error_bh_i((sdp), (bh), __func__, __FILE__, __LINE__, false)
>
>
>  extern struct kmem_cache *gfs2_glock_cachep;
> --
> 2.18.4

Yeah okay, there are two more instances of exactly the same pattern
further below in the same header file. I'm adding fixes for those as
well.

Thanks,
Andreas

