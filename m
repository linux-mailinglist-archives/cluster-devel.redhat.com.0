Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 763814BA675
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 17:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645116913;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=f8QNhRBZDAkEJLh/72DU8LfZwW73weZWrxpTQWpC2Mc=;
	b=hm5bTNcKAxqDXF1Pmc/O4gnK55AsqxS8SuGbymohLpSoOAKZFhG/PTn9tM31USVQQ6mCSZ
	YhF1F0wuXkFni16qQeySxujOSrBhCbDuxPnUSWclIFrB6u/jFKMpcAzALakzfrjQvG9qTt
	+Vwc/e7A8m+uQToLSLPdiHG3Sq8erEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-mqwiikbqNrGRFnvS0NMKzw-1; Thu, 17 Feb 2022 11:55:10 -0500
X-MC-Unique: mqwiikbqNrGRFnvS0NMKzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FDA518460E5;
	Thu, 17 Feb 2022 16:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB2278AAD;
	Thu, 17 Feb 2022 16:55:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEF171809CB8;
	Thu, 17 Feb 2022 16:55:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HGswtU021955 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 11:54:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B85B67DE4B; Thu, 17 Feb 2022 16:54:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C4A37DE4E;
	Thu, 17 Feb 2022 16:54:41 +0000 (UTC)
Date: Thu, 17 Feb 2022 10:54:39 -0600
From: David Teigland <teigland@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20220217165439.GB28418@redhat.com>
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
	<CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity
 checks with WARN_ON
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 17, 2022 at 01:36:44AM +0100, Andreas Gruenbacher wrote:
> On Wed, Feb 16, 2022 at 5:16 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > -       spin_lock(&ops_lock);
> > > > -       if (!list_empty(&op->list)) {
> > > > -               log_error(ls, "dlm_posix_lock: op on list %llx",
> > > > -                         (unsigned long long)number);
> > > > -               list_del(&op->list);
> > > > -       }
> > > > -       spin_unlock(&ops_lock);
> > > > +       WARN_ON(!list_empty(&op->list));
> > >
> > > Why don't those checks need the ops_lock spin lock anymore?
> > > Why does it make sense to get rid of the list_del calls?
> >
> > My understanding is that those list_del() calls try to recover
> > something if a sanity check hits. The list_emptry() check should
> > always be true at this point no matter if lock is held or not.
> > Therefore no lock is required here to do some sanity checking.
> 
> I don't immediately see what, other than the spin lock, would
> guarantee a consistent memory view. In other words, without taking the
> spin lock, 'list_empty(&op->list)' might still be true on one CPU even
> though another CPU has already added 'op' to a list. 

I'm not sure what thread contexts are running on the CPUs in your example.

> So please, when changing the locking somewhere, explain why the change
> is correct beyond just stating that the locking isn't needed.

Since the removed locking was not actually doing anything useful, there's
a limited amount that can be said about what it changes.

It's clear that the ops_lock protects the lists.  The op is not on any
list at this point, and if it were the code is broken.  WARN_ON seems like
the preferred way to indicate failed assumptions in the code.  In other
words, the code was making a shallow and cosmetic attempt to look robust
rather than broken.

Dave

