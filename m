Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A36271F
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jul 2019 19:30:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6A3181DF3;
	Mon,  8 Jul 2019 17:30:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 678B25D9C8;
	Mon,  8 Jul 2019 17:29:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AF921833002;
	Mon,  8 Jul 2019 17:29:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68HTZH7004087 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 13:29:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0D5F5D70D; Mon,  8 Jul 2019 17:29:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE672D1C7
	for <cluster-devel@redhat.com>; Mon,  8 Jul 2019 17:29:33 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
	[209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6696F2F8BD5
	for <cluster-devel@redhat.com>; Mon,  8 Jul 2019 17:29:33 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id j4so9528863otc.5
	for <cluster-devel@redhat.com>; Mon, 08 Jul 2019 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nA6Jna13w+RzGgaq8zqHZyOTzP+Rl2ic3AndNFYmYd4=;
	b=OLGB7Km9mK0zwAj5usfPJ70dzuVZZmrE22Z1dkJq1sLhY4vdWbG6Wrm4i7TeDIqaem
	ZKQMzcu5m6LALAEdtFEPF0N4Z+o4oR5ACNRqSXTdFDIUbrai51mOdyzOjKdnf+mw0v5F
	xTwKygL45FN9sUfPGyutiaeNx8XCUhpQSrxM9EIebsjl70DLvNyxaZw0pDUd7R5KiNd9
	lm76vrm41VmQhZF3bGPBf90wQOwlRk8asNPO9yub8xq62DTPRxCJU3cDBLQvRllpgQay
	Gg5hG3Hlyz3VVeQkeVAH1JkBHsQDll8GffZ85bILbi1oHnHH25PVdv9kfKYPEsNMabXr
	CTyA==
X-Gm-Message-State: APjAAAWaVy2z/xrh6M3au6zvHaudeCp+EuHlQa6jX+DQmEvZ9rnR90NK
	cXFnqXgTVdmH7sMxJ24oetcBJXbpgbW+qSWt4E7zS7nM0YEEfmXi5yM/817lJUMQjqOlnWPqYot
	EICUAWPE+5CQk7Uqr76vXxlzlKXH04FKM7riRkA==
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr15913827oti.341.1562606972842; 
	Mon, 08 Jul 2019 10:29:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0RPvy74yzmrSczU2RfOeT51FXoyiAVwrmEDfjnlD9nHbQUGYVCsDvdT1tpWknkWW1QJvBsFLFOqZUsxSEAWw=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr15913810oti.341.1562606972599; 
	Mon, 08 Jul 2019 10:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190701215439.19162-1-hch@lst.de>
	<CAHc6FU5MHCdXENW_Y++hO_qhtCh4XtAHYOaTLzk+1KU=JNpPww@mail.gmail.com>
	<20190708160351.GA9871@lst.de>
In-Reply-To: <20190708160351.GA9871@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 8 Jul 2019 19:29:21 +0200
Message-ID: <CAHc6FU5942i0XrCjUAhR9NCmfLuu7_CoPXNDsdF0X+gCpF1cDQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] RFC: use the iomap writepage path in gfs2
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 08 Jul 2019 17:30:01 +0000 (UTC)

On Mon, 8 Jul 2019 at 18:04, Christoph Hellwig <hch@lst.de> wrote:
> On Thu, Jul 04, 2019 at 12:35:41AM +0200, Andreas Gruenbacher wrote:
> > Patch "gfs2: implement gfs2_block_zero_range using iomap_zero_range"
> > isn't quite ready: the gfs2 iomap operations don't handle IOMAP_ZERO
> > correctly so far, and that needs to be fixed first.
>
> What is the issue with IOMAP_ZERO on gfs2?  Zeroing never does block
> allocations except when on COW extents, which gfs2 doesn't support,
> so there shouldn't really be any need for additional handling.

We still want to set iomap->page_ops for journalled data files on gfs2.

Also, if we go through the existing gfs2_iomap_begin_write /
__gfs2_iomap_begin logic for iomap_zero_range, it will work for
stuffed files as well, and so we can replace stuffed_zero_range with
iomap_zero_range.

> > Some of the tests assume that the filesystem supports unwritten
> > extents, trusted xattrs, the usrquota / grpquota / prjquota mount
> > options. There shouldn't be a huge number of failing tests beyond
> > that, but I know things aren't perfect.
>
> In general xfstests is supposed to have tests for that and not run
> the tests if not supported.  In most cases this is automatic, but
> in case a feature can't be autodetect we have a few manual overrides.

Yes, that needs a bit of work. Let's see.

Thanks,
Andreas

