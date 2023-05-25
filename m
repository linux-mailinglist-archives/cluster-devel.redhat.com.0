Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DE711A4B
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 00:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685054779;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/w8kourG8muqgM1V9FJPeJXvMt9bhE45UC3UnTkiIWE=;
	b=A7yYnEWAhMke/5y7YYzA2iYY9xS45+8MFUK/9LVqSj8ejAhSpVHJrBq+MG3WtXD1XXgs+O
	sA//GRpqguoGsfUFj4BSo6mfYDnUX2hXsRyBeHJoAjhrVUY/x1pmQrAsFp7+niM3wU/QXx
	PaJ8DIwJZCfLtGha/BXU2UPnrhX754o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-tIxuoJ6GPtC1OmMtVzPpfw-1; Thu, 25 May 2023 18:46:15 -0400
X-MC-Unique: tIxuoJ6GPtC1OmMtVzPpfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C9CF85A5A8;
	Thu, 25 May 2023 22:46:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4F0C1121314;
	Thu, 25 May 2023 22:46:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A259B19465B1;
	Thu, 25 May 2023 22:46:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C3C819465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 22:46:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2DAE740C6CDE; Thu, 25 May 2023 22:46:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2630940C6CDD
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 22:46:13 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A9408032FE
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 22:46:13 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73--htkgTGgNtqUP08eRCptSg-1; Thu, 25 May 2023 18:46:09 -0400
X-MC-Unique: -htkgTGgNtqUP08eRCptSg-1
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f3b9c88af8so22659e87.2; 
 Thu, 25 May 2023 15:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685054767; x=1687646767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/w8kourG8muqgM1V9FJPeJXvMt9bhE45UC3UnTkiIWE=;
 b=O/3RbnFKad2FWiP7/eCgHTAjdRvxa+1NVOTG1GOandRcxNuIrdzjEIF6AX6apiJBhj
 E/GAyjq8qWSs+CnEBSWtoblT72SuRNDSzARsEqWZSxqE/cF4sVr+XkWX1nXB1scy1IdE
 0PE0q5x/AEzgxpjszPIwBCxHxtkE2Eo7gU0tUniCDl7aMtGGY+B/QQ/xuOmYkL1vlzk1
 vMyPxlzvFurcogeCWeYfcvNNkktHYVzqYoO7nU5dJiY30Qvonw2UiIgp/4qk/HNP+L+Q
 7zvGtw6V/wC6ZS1gSzuONl2DnF/Rp8uDx8zcp+n/9BerfzJuptvvRWUPK85UmN8l7Vho
 MMhw==
X-Gm-Message-State: AC+VfDzM3RBcq6+vOMyadEewIjmr+QdS/H/j/j3IEohNdUStcHRuYC11
 5SRaMsnYoJ3fastxywLXKAxdyr05S/JrdSESv4EOhboRill/hg==
X-Google-Smtp-Source: ACHHUZ4VB2AEvZmEKL/ToOYQHq7bNrYU7r6ytuAfwSAkDgHAxv18Bh8nagqgxi77E7DS39/2qAzMZ2yLDzeqZIfKhy0=
X-Received: by 2002:a05:6512:25a:b0:4e9:bafc:88d0 with SMTP id
 b26-20020a056512025a00b004e9bafc88d0mr6824592lfo.23.1685054766774; Thu, 25
 May 2023 15:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan> <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzugpw7vgCFxOYL@moria.home.lan> <20230525084731.losrlnarpbqtqzil@quack3>
In-Reply-To: <20230525084731.losrlnarpbqtqzil@quack3>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 26 May 2023 00:45:55 +0200
Message-ID: <CAHpGcMLzYG9RemHsnigj+5e1x0-_Sobra_k7N-tXLkcvEuoYXw@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
 Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"

Am Do., 25. Mai 2023 um 10:56 Uhr schrieb Jan Kara <jack@suse.cz>:
> On Tue 23-05-23 12:49:06, Kent Overstreet wrote:
> > > > No, that's definitely handled (and you can see it in the code I linked),
> > > > and I wrote a torture test for fstests as well.
> > >
> > > I've checked the code and AFAICT it is all indeed handled. BTW, I've now
> > > remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> > > ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
> > > way (by prefaulting pages from the iter before grabbing the problematic
> > > lock and then disabling page faults for the iomap_dio_rw() call). I guess
> > > we should somehow unify these schemes so that we don't have two mechanisms
> > > for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
> >
> > Oof, that sounds a bit sketchy. What happens if the dio call passes in
> > an address from the same address space?
>
> If we submit direct IO that uses mapped file F at offset O as a buffer for
> direct IO from file F, offset O, it will currently livelock in an
> indefinite retry loop. It should rather return error or fall back to
> buffered IO. But that should be fixable. Andreas?

Yes, I guess. Thanks for the heads-up.

Andreas

> But if the buffer and direct IO range does not overlap, it will just
> happily work - iomap_dio_rw() invalidates only the range direct IO is done
> to.
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
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

