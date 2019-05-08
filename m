Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C47AA181CA
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 23:51:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0E7B368E3;
	Wed,  8 May 2019 21:51:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC6617B94;
	Wed,  8 May 2019 21:51:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0ED9A18089CA;
	Wed,  8 May 2019 21:51:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48LowQc015011 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 17:50:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1346E1001E6C; Wed,  8 May 2019 21:50:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBCC91001DE8;
	Wed,  8 May 2019 21:50:53 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C666368E3;
	Wed,  8 May 2019 21:50:53 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E872E316;
	Wed,  8 May 2019 21:50:51 +0000 (UTC)
Date: Wed, 8 May 2019 15:50:50 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190508155050.186a1ba4@lwn.net>
In-Reply-To: <CAHk-=wiUMj0nwj_ee59J4yLnbnR_UfMeRx4agijSc7DKJADoPw@mail.gmail.com>
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
	<CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
	<CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
	<CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
	<20190508145818.6a53dff5@lwn.net>
	<CAHk-=wiUMj0nwj_ee59J4yLnbnR_UfMeRx4agijSc7DKJADoPw@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Wed, 08 May 2019 21:50:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Wed, 08 May 2019 21:50:53 +0000 (UTC) for IP:'45.79.88.28'
	DOMAIN:'ms.lwn.net' HELO:'ms.lwn.net' FROM:'corbet@lwn.net' RCPT:''
X-RedHat-Spam-Score: -0.011  (RCVD_IN_DNSWL_NONE,
	SPF_PASS) 45.79.88.28 ms.lwn.net 45.79.88.28 ms.lwn.net
	<corbet@lwn.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>, "Tobin C.
	Harding" <me@tobin.cc>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] GFS2: Pull Request
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 08 May 2019 21:51:06 +0000 (UTC)

On Wed, 8 May 2019 14:05:35 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, May 8, 2019 at 1:58 PM Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > I think this certainly belongs in the maintainer manual, but probably not
> > in pull-requests.rst.  There are a lot of things about repository
> > management that seem to trip up even experienced maintainers; pre-pull
> > merges is just one of those.  I would love to see a proper guide on when
> > and how to do merges in general.  
> 
> We had another pull request issue today, about a situation that I
> definitely know you've written about in the past, because I linked to
> lwn in my email:
> 
>    https://lore.kernel.org/lkml/CAHk-=wiKoePP_9CM0fn_Vv1bYom7iB5N=ULaLLz7yOST3K+k5g@mail.gmail.com/

Sigh, I never can escape my past sins...

> and while I suspect people don't actually read documentation
> (_particularly_ maintainers that have already been around for a long
> time but still do this), maybe that part could be in the same
> documentation?

Something derived from that would make sense, yes.  I'll see if I can't
pull something together, unless by some delightful miracle somebody beats
me to it.

jon

