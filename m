Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5AFC3FCA9E
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Aug 2021 17:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630422985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=geN9iKiMV4jfX+gPjsViYlu0xMJFQxzklaZaxE7XMfM=;
	b=WxvuhRtf5eKeDMKIwH/hHWtFZk71f7qbO1pFChfhzoFgI7/8MH7FIDgsp1o3EkhgKS46yu
	SNYO0ZdyDavok8yRMD6cbSn77Peihrg05gHR1uLnuRHsBEHEa5P9fl4RQYY5Ac+F9OYEBY
	pbe0stqSqgyfNbjzk+V5fn59w6tIBoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-TIOmqTgjM1GTRoAClgRBiQ-1; Tue, 31 Aug 2021 11:16:23 -0400
X-MC-Unique: TIOmqTgjM1GTRoAClgRBiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD360106F718;
	Tue, 31 Aug 2021 15:16:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEA660CC9;
	Tue, 31 Aug 2021 15:16:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD7BA4A7C8;
	Tue, 31 Aug 2021 15:16:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17VF27hB016128 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 31 Aug 2021 11:02:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36F69114B2F4; Tue, 31 Aug 2021 15:02:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32747114B2F0
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 15:02:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54675802319
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 15:02:04 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-556-3p2h9AiqNBeCec0SysdT3w-1; Tue, 31 Aug 2021 11:02:02 -0400
X-MC-Unique: 3p2h9AiqNBeCec0SysdT3w-1
Received: by mail-wm1-f72.google.com with SMTP id
	h1-20020a05600c350100b002e751bf6733so1434108wmq.8
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 08:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=geN9iKiMV4jfX+gPjsViYlu0xMJFQxzklaZaxE7XMfM=;
	b=tA7u9k9IT83L9iCBPvlmMR8C1R1AQF0+NSIjx3/a5hSmFbEX/O0faIGXpYGD9kaz9Q
	7gs6jDKWTmVGIo9Q88EyrKFwXwmxbCQRuGbdFpXetZta7TLWhUizZYe3Zuxr5XW3/s9j
	dl8tRfN8o4OtC1zV67yAK0f7V93scd7a7Kj3GtxT99HzaYkXR4LS4h0qkcMr1AW2fsaB
	diw/btrUTPQiJDUObi9L9xfeHqUYLkCfpPW9FDf6seC/SQHZHGTo302cszbGt6snnQ0h
	m+Eqy7M6MuvBnD5khW0y+qLXVIbeubzM8bhsrd202FmyM9gTVKyrbO+1YKOap/5xA+vG
	0CoA==
X-Gm-Message-State: AOAM531qwYUxaIha2GKelrpwDzb6yYxFhuMhYJhlLrjhaSx/h/tBWPk5
	yjKdrRzXJPmh/aDZ3HY0LfKpC9BEgg1DdfwGYgea3oF/uZf+4RKqAHyJ6ojK1YkwCu3ImbYMwH3
	aEaUIopOwezY+0nUbdLlkjD9FpsVKBfjckmejww==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
	n35mr4712197wms.166.1630422119496; 
	Tue, 31 Aug 2021 08:01:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWBRYd7VRXYzGstG1+NFlxgSwXpf+/Nr//YhmkDW+0FjfFhjYdoY83Dp0k2jY8TKlOXXCcDEtctWTcyUBM5e8=
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
	n35mr4712190wms.166.1630422119361; 
	Tue, 31 Aug 2021 08:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210831100729.GA16317@kili>
In-Reply-To: <20210831100729.GA16317@kili>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 31 Aug 2021 17:01:48 +0200
Message-ID: <CAHc6FU6fEGXEd0xwA3qqOifscga+DYUCWEhnQcUBbim=gE1uow@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [bug report] new ->follow_link() and
 ->put_link() calling conventions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Tue, Aug 31, 2021 at 12:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello GFS2 devs,
>
> The ancient patch 680baacbca69: "new ->follow_link() and ->put_link()
> calling conventions" from May 2, 2015, leads to the following
> Smatch static checker warning:
>
>         fs/gfs2/inode.c:1806 gfs2_get_link()
>         error: passing non negative 13 to ERR_PTR

this looks like a false positive: gh->gh_error will only be set to
GLR_TRYFAILED when try_futile is true, and try_futile will only be
true when the LM_FLAG_TRY or LM_FLAG_TRY_1CB flag in gh->gh_flags is
set. The code is a bit convoluted, and it's not surprising that smatch
doesn't understand what's going on.

Thanks,
Andreas

