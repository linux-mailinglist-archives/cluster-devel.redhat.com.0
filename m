Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86F5EF30
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Jul 2019 00:36:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0BEC4E938;
	Wed,  3 Jul 2019 22:36:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE80419E3F;
	Wed,  3 Jul 2019 22:36:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DE9918184A5;
	Wed,  3 Jul 2019 22:36:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x63MZthB015696 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jul 2019 18:35:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5478D1001B27; Wed,  3 Jul 2019 22:35:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FAAF1001B14
	for <cluster-devel@redhat.com>; Wed,  3 Jul 2019 22:35:53 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0910285A07
	for <cluster-devel@redhat.com>; Wed,  3 Jul 2019 22:35:53 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id 16so1924449otu.2
	for <cluster-devel@redhat.com>; Wed, 03 Jul 2019 15:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uF998D8BR4hjaWYM/cm2nCswL6OUaWgofBX0cNua7mY=;
	b=FuxmTEPwwYo5PMPybYlriVQURqneoObnt83bFtvQQzHlctidldHDjw68K48EOX5ehC
	1jnTE9MBEu7B51cSO+Jfv9AVXRLHVpwnKC6OmXQxgC+Rrpxqbd26r7lXdVbSU8NX0LMz
	QNOEtGyjfE0O0bON/1RDayMhn+ctFNiBscmsigaEAr/1Ag+XLULs1McbDXdEpMj4NX11
	I3z6uoksO2C9gB02MbtJFAGiJMw411kgOTfEEsGPUvFdjIcjY5qKsMhYEqaDBjP26vn6
	eEBdHOn6yuXh7bF3JnSpF9Ph7omTRTJ3vXMREW1bBwqW9KP3gWyh/0kSbhS8RGU7ZsJu
	Rv8g==
X-Gm-Message-State: APjAAAU5Vz+Ltq3m8eB5HIx15o8cxsDItfx1PbY+sIHN6WmDkTkYhHJf
	0fjmDnUyLSYIgEMewQXi2I/IDJmlndHW3b7ofi7/WhRc30BdFzY0DwJoHhL4jkkvrEUyiLODTq0
	NgbbGmHsj0GB1PQ9bk3nMQBdDLdYD5bJBwSZNiQ==
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr28332643oti.341.1562193352533; 
	Wed, 03 Jul 2019 15:35:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyb3lCMpWvP5vv5fGbRMbkszNsSf4Dh8Q3SscBMZpgOEptvKSRqy1VjJc/2nmujeUFQiYMDumOh8kn0s1bWND8=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr28332622oti.341.1562193352267; 
	Wed, 03 Jul 2019 15:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190701215439.19162-1-hch@lst.de>
In-Reply-To: <20190701215439.19162-1-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 4 Jul 2019 00:35:41 +0200
Message-ID: <CAHc6FU5MHCdXENW_Y++hO_qhtCh4XtAHYOaTLzk+1KU=JNpPww@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 03 Jul 2019 22:36:33 +0000 (UTC)

Hi Christoph,

On Mon, 1 Jul 2019 at 23:54, Christoph Hellwig <hch@lst.de> wrote:
> Hi all,
>
> in this straight from the jetplane edition I present the series to
> convert gfs2 to full iomap usage for the ordered and writeback mode,
> that is we use iomap_page everywhere and entirely get rid of
> buffer_heads in the data path.

thank you very much, this is looking very good. I've done some testing
with your cleanups applied so that those can go in in this merge
window. The result can be found here:

  https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next.cleanups

Patch "gfs2: implement gfs2_block_zero_range using iomap_zero_range"
isn't quite ready: the gfs2 iomap operations don't handle IOMAP_ZERO
correctly so far, and that needs to be fixed first.

The actual buffer head removal will obviously have to wait a little
longer because of the required infrastructure changes, but also
because that still needs a lot more review and testing work.

> This has only seen basic testing which ensured neither 4k or 1k blocksize
> in ordered mode regressed vs the xfstests baseline, although that baseline
> tends to look pretty bleak.

Some of the tests assume that the filesystem supports unwritten
extents, trusted xattrs, the usrquota / grpquota / prjquota mount
options. There shouldn't be a huge number of failing tests beyond
that, but I know things aren't perfect.

> The series is to be applied on top of my "lift the xfs writepage code
> into iomap v2" series.

Again, thanks a lot for the patches!

Andreas

