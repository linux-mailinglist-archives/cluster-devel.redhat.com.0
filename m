Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD01439E6F
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Oct 2021 20:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635186308;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=F3SLaknlCrgsyNEFXulutuLS6zkvJHd+fv8cS/rpPqI=;
	b=hW+qHsocQm7+xIAIY4pnAnlgbooyfdnfQ79wCyMN/TwOJL5yLJShO+ed/RCztyE0Cl1Wj1
	I1aK+MeS2UJqDKmXvywmhbvX8KeV+XjfJTAUULqVaO3urQz1QzhM2qymKo8aIMaCyrHgoT
	D6fzgDmGH56RnT7GGDeTAizBIFIFJ1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-ciEFzW1mOsmI5PIIQpDKqg-1; Mon, 25 Oct 2021 14:25:04 -0400
X-MC-Unique: ciEFzW1mOsmI5PIIQpDKqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EB571006AAB;
	Mon, 25 Oct 2021 18:25:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0E4960BF1;
	Mon, 25 Oct 2021 18:25:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F2781801241;
	Mon, 25 Oct 2021 18:24:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19PIOlfA030459 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Oct 2021 14:24:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BEBB1121318; Mon, 25 Oct 2021 18:24:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 666A81121315
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 18:24:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33DE61857F00
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 18:24:40 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-rb2kyinvNtK4307Cmzmj_g-1; Mon, 25 Oct 2021 14:24:38 -0400
X-MC-Unique: rb2kyinvNtK4307Cmzmj_g-1
Received: by mail-wm1-f71.google.com with SMTP id
	v10-20020a1cf70a000000b00318203a6bd1so313511wmh.6
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 11:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F3SLaknlCrgsyNEFXulutuLS6zkvJHd+fv8cS/rpPqI=;
	b=fm+8HvJwk5K7a8v4sWaHPbpbKEUFgxULdjCwBdcyAFNHgStjC57AmHLRuESfoBlpYD
	r3uujWjyNXb3BlWSXxw3E/r4o0FYMa4Dl9bTz9V1x3KdwECjYGR7pjI0mWlB/cM+yJ0/
	DCi+TXEl6mbAMvh9Ky/7qVmAB/Qbw1fHuBskX1iq2CrStH3MA3F25h/72LdHl0N5k4Z+
	B7YRmyrrZCK7pGmPpQcnwszBs9L6vI85bP7yE+JD4RX2l6VKy51RNHdxTtXJzDhVb8U+
	CmIs13zvlucsS8+O9g0KqOXJg3WtKX7qWSETjFx5iqif7rR4PjC/Ol4ssIsD+jw1QQ6f
	9Ueg==
X-Gm-Message-State: AOAM5338N3Fva1xGMueuDRPlPjS29tE4teoTldwcYl+z1A3r403Gdchz
	xCQXtIpb9S03NLj9/ggC5w7FErESvbNDEfUZ7z+lTdkundS8pXp58Jjef7lmYVuhlNKi8uh8mMP
	D3hnz6chs8oVK6gQnYuGAHnJ84TH+r4mq8IaCTQ==
X-Received: by 2002:a5d:4bc2:: with SMTP id l2mr24538442wrt.81.1635186277624; 
	Mon, 25 Oct 2021 11:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFzXJ9qteuovw6CsfxV07yOsXNr94Jrc52XFmj3IWaW0sfPtl2ViNad/7UKAIgfk9H2m/v1wcPdQgWW5/Viog=
X-Received: by 2002:a5d:4bc2:: with SMTP id l2mr24538418wrt.81.1635186277388; 
	Mon, 25 Oct 2021 11:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
In-Reply-To: <YXL9tRher7QVmq6N@arm.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 25 Oct 2021 20:24:26 +0200
Message-ID: <CAHc6FU6JC4ZOwA8t854WbNdmuiNL9DPq0FPga8guATaoCtvsaw@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, "Ted Ts'o" <tytso@mit.edu>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
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

commit
On Fri, Oct 22, 2021 at 8:07 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> On Wed, Oct 20, 2021 at 08:19:40PM -1000, Linus Torvalds wrote:
> > On Wed, Oct 20, 2021 at 12:44 PM Catalin Marinas
> > <catalin.marinas@arm.com> wrote:
> > >
> > > However, with MTE doing both get_user() every 16 bytes and
> > > gup can get pretty expensive.
> >
> > So I really think that anything that is performance-critical had
> > better only do the "fault_in_write()" code path in the cold error path
> > where you took a page fault.
> [...]
> > So I wouldn't worry too much about the performance concerns. It simply
> > shouldn't be a common or hot path.
> >
> > And yes, I've seen code that does that "fault_in_xyz()" before the
> > critical operation that cannot take page faults, and does it
> > unconditionally.
> >
> > But then it isn't the "fault_in_xyz()" that should be blamed if it is
> > slow, but the caller that does things the wrong way around.
>
> Some more thinking out loud. I did some unscientific benchmarks on a
> Raspberry Pi 4 with the filesystem in a RAM block device and a
> "dd if=/dev/zero of=/mnt/test" writing 512MB in 1MB blocks. I changed
> fault_in_readable() in linux-next to probe every 16 bytes:
>
> - ext4 drops from around 261MB/s to 246MB/s: 5.7% penalty
>
> - btrfs drops from around 360MB/s to 337MB/s: 6.4% penalty
>
> For generic_perform_write() Dave Hansen attempted to move the fault-in
> after the uaccess in commit 998ef75ddb57 ("fs: do not prefault
> sys_write() user buffer pages"). This was reverted as it was exposing an
> ext4 bug. I don't [know] whether it was fixed but re-applying Dave's commit
> avoids the performance drop.

Interesting. The revert of commit 998ef75ddb57 is in commit
00a3d660cbac. Maybe Dave and Ted can tell us more about what went
wrong in ext4 and whether it's still an issue.

Commit 998ef75ddb57 looks mostly good except that it should loop
around whenever the fault-in succeeds even partially, so it needs the
semantic change of patch 4 [*] of this series. A copy of the same code
now lives in iomap_write_iter, so the same fix needs to be applied
there. Finally, it may be worthwhile to check for pagefault_disabled()
in generic_perform_write and iomap_write_iter before trying the
fault-in; this would help gfs2 which will always call into
iomap_write_iter with page faults disabled, and additional callers
like that could emerge relatively soon.

[*] https://lore.kernel.org/lkml/20211019134204.3382645-5-agruenba@redhat.com/

> btrfs_buffered_write() has a comment about faulting pages in before
> locking them in prepare_pages(). I suspect it's a similar problem and
> the fault_in() could be moved, though I can't say I understand this code
> well enough.
>
> Probing only the first byte(s) in fault_in() would be ideal, no need to
> go through all filesystems and try to change the uaccess/probing order.

Thanks,
Andreas

