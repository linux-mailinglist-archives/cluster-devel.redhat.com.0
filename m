Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA941BFB4
	for <lists+cluster-devel@lfdr.de>; Tue, 14 May 2019 00:57:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28DF98830B;
	Mon, 13 May 2019 22:57:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62D660856;
	Mon, 13 May 2019 22:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2271E18089CB;
	Mon, 13 May 2019 22:57:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DMvdAQ027237 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 18:57:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F24C1001DF6; Mon, 13 May 2019 22:57:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4987D1001947
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:57:36 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B220059440
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 22:57:36 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id 1so5421809oin.3
	for <cluster-devel@redhat.com>; Mon, 13 May 2019 15:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oZl+JJzZx2AFDb2lZBN8xQ+7GyeFp75okyysAoofKkw=;
	b=XN+K0PS69DCjjiEF7/5EhmV/6IomaeVyu5i8tHeVKNieEwNO3ySo55sUtyGIrFeGkI
	jqIbFHdAkMh4ENIgct2vQtsWH0B6r0+dei3VSzPsF+ZUyTNOQuLv+9Sx4+f4PK+JUtJa
	jy6MugRoxokQcMmwJUQsnfCuJ5BkZEtXL4h2H7X4dXLbTqqIJicZUyQllFZrd30um2mA
	QHQyLjn7eL87ygH0yS2gf/+nq/4/Ixfwm6QE/RdTWDBuiNkbcjOCK2uUm5EpzLxm52Ks
	MEtVaCeVXNDyt4OIfoS0jQ482LDAET30Up8eJWMvCGSKQ14DppTOE8/wBov38S1PVQy4
	/xxg==
X-Gm-Message-State: APjAAAXFpQjfzJbF+IbTaMaR+LvW7q3UXVxUScIfrDmrELqQb7z5R/kG
	qG6j1xMdRrAwPtm/pmejiyjhQ97ivbyDhDlDTKBGWU7/VpBBqI4obwuT3+56GNWTP95e8UZL1GE
	dLjtKk0nhSmvB8q8pk9bd2OqYwWFSMAvXv1cxfg==
X-Received: by 2002:a9d:6a58:: with SMTP id h24mr16790411otn.190.1557788255918;
	Mon, 13 May 2019 15:57:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXa/xUzbV2HecqFfqi9d2w5SpH6nk8apUHTk6bzR3d8Bzcbpr+9t1YrxaqHvhBUkP9YGkr0xw1NKR+yP3ShkU=
X-Received: by 2002:a9d:6a58:: with SMTP id h24mr16790402otn.190.1557788255765;
	Mon, 13 May 2019 15:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190513195904.15726-1-agruenba@redhat.com>
	<CAHk-=wg=yz_=6oM1r5C4pWJPac8cD1kHiki73wDciuLLoRNY=w@mail.gmail.com>
	<CAHc6FU43Fv_b9hMiRscs+cPbwLmcCBM-9R32fSsK9gUtMVMGUQ@mail.gmail.com>
	<CAHk-=wipiSQ=+dTssFhjYXUS0VgJYRNqy8s_YNTL8HbZ6iKsYg@mail.gmail.com>
In-Reply-To: <CAHk-=wipiSQ=+dTssFhjYXUS0VgJYRNqy8s_YNTL8HbZ6iKsYg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 14 May 2019 00:57:24 +0200
Message-ID: <CAHc6FU7WsCx4B53d5=N114A7E22A=nmXX-4Sz=uSKEsf65v3-w@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	"Tobin C. Harding" <tobin@kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix error path kobject memory leak
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 13 May 2019 22:57:43 +0000 (UTC)

On Tue, 14 May 2019 at 00:47, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, May 13, 2019 at 3:37 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Sorry, I should have been more explicit. Would you mind taking this
> > patch, please? If it's more convenient or more appropriate, I'll send
> > a pull request instead.
>
> Done.
>
> However, I'd like to point out that when I see patches from people who
> I normally get a pull request from, I usually ignore them.
>
> Particularly when they are in some thread with discussion, I'll often
> just assume that  the patch is part of the thread, not really meant
> for me in particular.
>
> In this case I happened to notice that suddenly my participation
> status changed, which is why I asked, but in general I might have just
> archived the thread with the assumption that I'll be getting the patch
> later as a git pull.
>
> Just so you'll be aware of this in the future, in case I don't react...

Thanks.

Copying Jon because this looks like useful information for other
maintainers as well.

Andreas

