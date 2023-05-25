Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBFC71193C
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 23:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685050638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NpYQakP/W6RPFRm8zMcoftE0dEwMWiRIJfKT61WqU5A=;
	b=HwsOcgbNNfG3mpW+wBr/YU1u+bx04RcVDGNwGe1cEEyk14GgVMQpiVq69biW4APIBgME8U
	iVICmGjnQEAQExs3Rm+i4DlqreAY+chUGyyqMMf2+c8S9GNKs1aMxgjQV1mwmyyY4pPfes
	NSXGs73GYL12+D3S+YgvhjRJexCrKsw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-EDVWfCwAMnqBGWK9nf7AOA-1; Thu, 25 May 2023 17:37:14 -0400
X-MC-Unique: EDVWfCwAMnqBGWK9nf7AOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11DDF3C11C62;
	Thu, 25 May 2023 21:37:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A83DB1121314;
	Thu, 25 May 2023 21:37:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 68AC319465B1;
	Thu, 25 May 2023 21:37:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5424019465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 21:36:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 829AE140E961; Thu, 25 May 2023 21:36:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE45140E95D
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 21:36:58 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DFE285A5B5
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 21:36:58 +0000 (UTC)
Received: from out-1.mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-d70B0Yc1NdKLYlCVobTD0A-1; Thu,
 25 May 2023 17:36:56 -0400
X-MC-Unique: d70B0Yc1NdKLYlCVobTD0A-1
Date: Thu, 25 May 2023 17:36:50 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZG/U8pl8Zp3Wei7Z@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzugpw7vgCFxOYL@moria.home.lan>
 <20230525084731.losrlnarpbqtqzil@quack3>
MIME-Version: 1.0
In-Reply-To: <20230525084731.losrlnarpbqtqzil@quack3>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 10:47:31AM +0200, Jan Kara wrote:
> If we submit direct IO that uses mapped file F at offset O as a buffer for
> direct IO from file F, offset O, it will currently livelock in an
> indefinite retry loop. It should rather return error or fall back to
> buffered IO. But that should be fixable. Andreas?
> 
> But if the buffer and direct IO range does not overlap, it will just
> happily work - iomap_dio_rw() invalidates only the range direct IO is done
> to.

*nod*

readahead triggered from the page fault path is another consideration.
No idea how that interacts with the gf2s method; IIRC there's a hack in
the page fault path that says somewhere "we may be getting called via
gup(), don't invoke readahead".

We could potentially kill that hack if we lifted this to the VFS layer.

> 
> > What happens if we race with the pages we faulted in being evicted?
> 
> We fault them in again and retry.
> 
> > > Also good that you've written a fstest for this, that is definitely a useful
> > > addition, although I suspect GFS2 guys added a test for this not so long
> > > ago when testing their stuff. Maybe they have a pointer handy?
> > 
> > More tests more good.
> > 
> > So if we want to lift this scheme to the VFS layer, we'd start by
> > replacing the lock you added (grepping for it, the name escapes me) with
> > a different type of lock - two_state_shared_lock in my code, it's like a
> > rw lock except writers don't exclude other writers. That way the DIO
> > path can use it without singlethreading writes to a single file.
> 
> Yes, I've noticed that you are introducing in bcachefs a lock with very
> similar semantics to mapping->invalidate_lock, just with this special lock
> type. What I'm kind of worried about with two_state_shared_lock as
> implemented in bcachefs is the fairness. AFAICS so far if someone is e.g.
> heavily faulting pages on a file, direct IO to that file can be starved
> indefinitely. That is IMHO not a good thing and I would not like to use
> this type of lock in VFS until this problem is resolved. But it should be
> fixable e.g. by introducing some kind of deadline for a waiter after which
> it will block acquisitions of the other lock state.

Yeah, my two_state_shared lock is definitely at the quick and dirty
prototype level, the implementation would need work. Lockdep support
would be another hard requirement.

The deadline might be a good idea, OTOH it'd want tuning. Maybe
something like what rwsem does where we block new read acquirerers if
there's a writer waiting would work.

