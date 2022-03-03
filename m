Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 283224CBA0C
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Mar 2022 10:21:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-CHbeWWjPNoK68J9WZVS8Aw-1; Thu, 03 Mar 2022 04:21:32 -0500
X-MC-Unique: CHbeWWjPNoK68J9WZVS8Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D39E824FAA;
	Thu,  3 Mar 2022 09:21:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB747B14E;
	Thu,  3 Mar 2022 09:21:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00ABF4BB40;
	Thu,  3 Mar 2022 09:21:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2239LPrv002944 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 3 Mar 2022 04:21:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BEAD340FF710; Thu,  3 Mar 2022 09:21:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E8D40FF70E
	for <cluster-devel@redhat.com>; Thu,  3 Mar 2022 09:21:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0D131C07831
	for <cluster-devel@redhat.com>; Thu,  3 Mar 2022 09:21:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-399-sOvqlKibMjmp3yh2-RFs5w-1; Thu, 03 Mar 2022 04:21:24 -0500
X-MC-Unique: sOvqlKibMjmp3yh2-RFs5w-1
Received: by mail-wr1-f47.google.com with SMTP id x15so6744301wru.13
	for <cluster-devel@redhat.com>; Thu, 03 Mar 2022 01:21:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=DvPDduUxIuKL+yC0AJiEs10ttn/sVwtbIKSiINsPfck=;
	b=Xjl8ZNBDu5VQQhmktOGWOjS3zgbyOAvSe5/8UL+T4mgM9JiA6a/QzhGFPMFO8TtZ3B
	5jjji1ntuyK5kChdRyrEnula5Ot7+1IdF5W/cpZdc090/1OCqitBzk3KJMbIyh07Kok3
	j7tPqwhFeGZVXQnOMihFi3X0q07bnC8k0pW05wFcg0nwBVHSJC6znKsSn577cskV11Nq
	rIin1Ke2NeoTj4s4rKubuN5n8Y0RAEoW2YkQURdXmLpqUdmS+cKijhah5h18yoRkT7Xo
	+/dir/tyIxkixFbsQQ5PJ07w6LcAa4xzGWUU9UpwiaBOwu/XtHrwB8IS0D0UvB8scPtW
	popA==
X-Gm-Message-State: AOAM532wELoLDwMVHnG763Ktc5REkqSGL/U56vAjX8vJXREo8R+r7tCn
	fBhnL5aqGZPyUt/7LNkPpK/wRA==
X-Google-Smtp-Source: ABdhPJyr7pVJbeXlptM3psyRHARpgFUUaoaGjdJbuLZWvib+4ssC3GztiHJ961bWXmr+1LqoREKl5w==
X-Received: by 2002:a05:6000:1b0a:b0:1ef:7c04:9bad with SMTP id
	f10-20020a0560001b0a00b001ef7c049badmr20292282wrz.54.1646299283022;
	Thu, 03 Mar 2022 01:21:23 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88]) by smtp.gmail.com with ESMTPSA id
	p16-20020adff210000000b001f062b80091sm353137wro.34.2022.03.03.01.21.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Mar 2022 01:21:22 -0800 (PST)
Date: Thu, 3 Mar 2022 09:21:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: "Theodore Ts'o" <tytso@mit.edu>
Message-ID: <YiCIkNci2V3IBRme@google.com>
References: <Yg0m6IjcNmfaSokM@google.com> <Yhks88tO3Em/G370@mit.edu>
	<YhlBUCi9O30szf6l@sol.localdomain> <YhlFRoJ3OdYMIh44@mit.edu>
	<YhlIvw00Y4MkAgxX@mit.edu> <YiBDf7XLnTe4Gwis@mit.edu>
MIME-Version: 1.0
In-Reply-To: <YiBDf7XLnTe4Gwis@mit.edu>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [PATCH -v4] ext4: don't BUG if kernel
 subsystems dirty pages without asking ext4 first
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 02 Mar 2022, Theodore Ts'o wrote:

> [un]pin_user_pages_remote is dirtying pages without properly warning
> the file system in advance.  A related race was noted by Jan Kara in
> 2018[1]; however, more recently instead of it being a very hard-to-hit
> race, it could be reliably triggered by process_vm_writev(2) which was
> discovered by Syzbot[2].
> 
> This is technically a bug in mm/gup.c, but arguably ext4 is fragile in
> that if some other kernel subsystem dirty pages without properly
> notifying the file system using page_mkwrite(), ext4 will BUG, while
> other file systems will not BUG (although data will still be lost).
> 
> So instead of crashing with a BUG, issue a warning (since there may be
> potential data loss) and just mark the page as clean to avoid
> unprivileged denial of service attacks until the problem can be
> properly fixed.  More discussion and background can be found in the
> thread starting at [2].
> 
> [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
> [2] https://lore.kernel.org/r/Yg0m6IjcNmfaSokM@google.com
> 
> Reported-by: syzbot+d59332e2db681cf18f0318a06e994ebbb529a8db@syzkaller.appspotmail.com
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> Cc: stable@kernel.org
> ---
> v4 - only changes to the commit description to eliminate some inaccuracies
>      and clarify the text.
> 
>  fs/ext4/inode.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

Thanks a bunch for sticking with this Ted.

I've been following along with great interest.

Sadly I am not in a position to provide a review.

Just wanted to pop by and say thank you.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

