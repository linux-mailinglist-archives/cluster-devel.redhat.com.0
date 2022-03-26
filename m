Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C264E7E75
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Mar 2022 02:42:02 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-RvObUfcUN6S9Ov1lmxKjJA-1; Fri, 25 Mar 2022 21:41:58 -0400
X-MC-Unique: RvObUfcUN6S9Ov1lmxKjJA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C72581C05AA4;
	Sat, 26 Mar 2022 01:41:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E86875E8A83;
	Sat, 26 Mar 2022 01:41:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1138B1940352;
	Sat, 26 Mar 2022 01:41:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 647E31940341 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 26 Mar 2022 01:41:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B625C15D7C; Sat, 26 Mar 2022 01:41:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 372F1C07F50
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 01:41:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CE5238041C5
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 01:41:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-xaG_vS6tPEaxAa8Qslu2rg-1; Fri, 25 Mar 2022 21:41:47 -0400
X-MC-Unique: xaG_vS6tPEaxAa8Qslu2rg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96267618AF;
 Sat, 26 Mar 2022 01:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6BAC004DD;
 Sat, 26 Mar 2022 01:41:45 +0000 (UTC)
Date: Fri, 25 Mar 2022 18:41:45 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20220326014145.GE8182@magnolia>
References: <20220325143701.144731-1-agruenba@redhat.com>
 <20220326000337.GD8182@magnolia>
 <CAHc6FU6ys6gQjqpT-p0b+9pRzQPGemvviAMJNgBvmXaM27k7jA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU6ys6gQjqpT-p0b+9pRzQPGemvviAMJNgBvmXaM27k7jA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [GIT PULL] fs/iomap: Fix buffered write page
 prefaulting
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, cluster-devel <cluster-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 26, 2022 at 01:22:17AM +0100, Andreas Gruenbacher wrote:
> On Sat, Mar 26, 2022 at 1:03 AM Darrick J. Wong <djwong@kernel.org> wrote:
> > On Fri, Mar 25, 2022 at 03:37:01PM +0100, Andreas Gruenbacher wrote:
> > > Hello Linus,
> > >
> > > please consider pulling the following fix, which I've forgotten to send
> > > in the previous merge window.  I've only improved the patch description
> > > since.
> > >
> > > Thank you very much,
> > > Andreas
> > >
> > > The following changes since commit 42eb8fdac2fc5d62392dcfcf0253753e821a97b0:
> > >
> > >   Merge tag 'gfs2-v5.16-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-11-17 15:55:07 -0800)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/write-page-prefaulting
> > >
> > > for you to fetch changes up to 631f871f071746789e9242e514ab0f49067fa97a:
> > >
> > >   fs/iomap: Fix buffered write page prefaulting (2022-03-25 15:14:03 +0100)
> >
> > When was this sent to fsdevel for public consideration?  The last time I
> > saw any patches related to prefaulting in iomap was November.
> 
> On November 23, exact same patch:
> 
> https://lore.kernel.org/linux-fsdevel/20211123151812.361624-1-agruenba@redhat.com/

Ah, ok, so I just missed it then.  Sorry about that, I seem to suck as
maintainer more and more by the day. :( :(

(Hey, at least you got the other maintainer to RVB it...)

--D

> Andreas
> 

