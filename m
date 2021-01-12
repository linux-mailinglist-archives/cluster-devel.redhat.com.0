Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01A122F2EFA
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Jan 2021 13:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610454460;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ty7QtoJ9pdYfOMMOOS69HzDJsTQjhWNF5r2aij6ZR3U=;
	b=OL87Br/HaDGp6LyukiN+cibQSxLp6Le5FE2t+QeFENVUA4UGJxplTMsBB1Q2s4cNOpaN19
	D7/IMUC2rjH1XmI4tYHhZTY4JkqRM2t4WoDm6wp1egKZB1hMZ5gY8dFhgziLM2kIUd865x
	HhN5xV99LjW7MLXtL8H952alArE14qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-5sJFMp-lN_yuJD6nXtKMxQ-1; Tue, 12 Jan 2021 07:27:38 -0500
X-MC-Unique: 5sJFMp-lN_yuJD6nXtKMxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BBD180A086;
	Tue, 12 Jan 2021 12:27:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA8F60CEB;
	Tue, 12 Jan 2021 12:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2662F4A7C6;
	Tue, 12 Jan 2021 12:27:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10CCRUpT020502 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 12 Jan 2021 07:27:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5022B110F745; Tue, 12 Jan 2021 12:27:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BDD8110F73E
	for <cluster-devel@redhat.com>; Tue, 12 Jan 2021 12:27:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB466858281
	for <cluster-devel@redhat.com>; Tue, 12 Jan 2021 12:27:27 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-276-VmHmjQPjNN-Y5ARsQK_Cuw-1; Tue, 12 Jan 2021 07:27:26 -0500
X-MC-Unique: VmHmjQPjNN-Y5ARsQK_Cuw-1
Received: by mail-wm1-f69.google.com with SMTP id h21so430229wmq.7
	for <cluster-devel@redhat.com>; Tue, 12 Jan 2021 04:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ty7QtoJ9pdYfOMMOOS69HzDJsTQjhWNF5r2aij6ZR3U=;
	b=PYE43RIGvgNDWcuQkKSsneNSKBvtnLlJ3SV/k+9snp5SL0QqWtSx9ZpH5wbqmnVcXw
	FPy1bwPLo8G1IgrdHja+nO7AQ1guH0Fzd6umohQIwXw7CwqyzGls7MReSNstGIl8ofkA
	im1vbNgvc9DdFPMFmfTWMZaNAAMAYMjRXALRCPkGCkPgEVJC/Vn6ll4kB+QsiwedYxzm
	cfQliQXr7QXPdk3uvlFu6gtoZUZa13p1Els1z7pj+J+aNXMMCFgT4y1MvPH91ObbpWYa
	PnE9mUW3a3NbdR1sx9z/gb2vk8mMWiu4Itny82KW0StEEJk7PbKvinB6GmY9gMOrRpBQ
	wOcw==
X-Gm-Message-State: AOAM5335J1KOdLCYYPdaDJXELAb9yWZbvyeT7jg81VPYp+W2R97yO38w
	FE2251cWRRfOzTmfSeV6D52nG+J49Dq4MgQmMBZ8pABHs7CuHcT94+1bvolAe1uwpNupz8GzdqA
	PD4oLACqwiPvqAoUwoYG2Z9Qa32OSOjdvJfmFOw==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr3469845wmd.2.1610454444987; 
	Tue, 12 Jan 2021 04:27:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvbQrt/uojpqylGevrw32XRBMdtbloaeCY7aMlA7GNWIpoE6VeutSmgOkzerRTSDF5iEa3BdUtTNTddaFWLMs=
X-Received: by 2002:a1c:9684:: with SMTP id y126mr3469829wmd.2.1610454444861; 
	Tue, 12 Jan 2021 04:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20210112114656.655846-1-anprice@redhat.com>
In-Reply-To: <20210112114656.655846-1-anprice@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 12 Jan 2021 13:27:13 +0100
Message-ID: <CAHc6FU5YsiXD-uvs1X63NWfZsm1-3rE+wvj+cVYCtzfVk1szSg@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix invalid block size message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 12:47 PM Andrew Price <anprice@redhat.com> wrote:
> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---
>  fs/gfs2/ops_fstype.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 64ad19bb978c..5a0fde5e67d9 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -180,7 +180,7 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
>
>         if (sb->sb_bsize < 512 || sb->sb_bsize > PAGE_SIZE ||
>             (sb->sb_bsize & (sb->sb_bsize - 1))) {
> -               pr_warn("Invalid superblock size\n");
> +               pr_warn("Invalid block size\n");
>                 return -EINVAL;
>         }

Added, thanks.

Andreas

