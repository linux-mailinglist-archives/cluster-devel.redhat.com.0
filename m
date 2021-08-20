Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F91F3F3112
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 18:06:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-gC6l6CprN0SyHArYTj0hGQ-1; Fri, 20 Aug 2021 12:06:53 -0400
X-MC-Unique: gC6l6CprN0SyHArYTj0hGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C441C107B834;
	Fri, 20 Aug 2021 16:06:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA86E2F6;
	Fri, 20 Aug 2021 16:06:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B5404BB7B;
	Fri, 20 Aug 2021 16:06:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KG6lbo032319 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 12:06:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2B44208AB79; Fri, 20 Aug 2021 16:06:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB43E20C15D9
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 16:06:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E1FC80120D
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 16:06:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-423-S7H5uGoBM5SxjrIxhx7Jvg-1;
	Fri, 20 Aug 2021 12:06:42 -0400
X-MC-Unique: S7H5uGoBM5SxjrIxhx7Jvg-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A85A6120F;
	Fri, 20 Aug 2021 16:06:39 +0000 (UTC)
Message-ID: <5c533ef663b9447206754c46afcab65d107dd207.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Hildenbrand <david@redhat.com>, torvalds@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Aug 2021 12:06:38 -0400
In-Reply-To: <0f4f3e65-1d2d-e512-2a6f-d7d63effc479@redhat.com>
References: <20210820135707.171001-1-jlayton@kernel.org>
	<20210820135707.171001-2-jlayton@kernel.org>
	<0f4f3e65-1d2d-e512-2a6f-d7d63effc479@redhat.com>
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
	stable@vger.kernel.org, willy@infradead.org, w@1wt.eu,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	rostedt@goodmis.org, ebiederm@xmission.com, luto@kernel.org,
	v9fs-developer@lists.sourceforge.net, akpm@linux-foundation.org,
	linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	viro@zeniv.linux.org.uk
Subject: Re: [Cluster-devel] [PATCH v2 1/2] fs: warn about impending
 deprecation of mandatory locks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-20 at 17:52 +0200, David Hildenbrand wrote:
> On 20.08.21 15:57, Jeff Layton wrote:
> > We've had CONFIG_MANDATORY_FILE_LOCKING since 2015 and a lot of distros
> > have disabled it. Warn the stragglers that still use "-o mand" that
> > we'll be dropping support for that mount option.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >   fs/namespace.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/fs/namespace.c b/fs/namespace.c
> > index ab4174a3c802..ffab0bb1e649 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -1716,8 +1716,16 @@ static inline bool may_mount(void)
> >   }
> >   
> >   #ifdef	CONFIG_MANDATORY_FILE_LOCKING
> > +static bool warned_mand;
> >   static inline bool may_mandlock(void)
> >   {
> > +	if (!warned_mand) {
> > +		warned_mand = true;
> > +		pr_warn("======================================================\n");
> > +		pr_warn("WARNING: the mand mount option is being deprecated and\n");
> > +		pr_warn("         will be removed in v5.15!\n");
> > +		pr_warn("======================================================\n");
> > +	}
> 
> Is there a reason not to use pr_warn_once() ?
> 
> 

No reason at all. I'll send out a v3 set in a bit with that change.

Thanks!
-- 
Jeff Layton <jlayton@kernel.org>

