Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC45116D0
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Apr 2022 14:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651062996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Q3NajTnxfaXiUWEWzwoSS9j+6RIZ90UuUICFGJF5sxU=;
	b=Bw88/G5NKqLHjm2QAkTAe4ZrkSFS9jydrYQ+R+iv1ItCsLBBtRX0fHEp76jCNHo5PWhF26
	qifFED5WzbxkLlF1WCTiNxp8BHnqvhNIJubamwRtZW6gI3nCIyt3MxVcTVsGxkz7lN8j3I
	6GyVfn13nA+IOe0ceZx+bW8RGNMIUI0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-dkoEzHd2MHOLVZdca5RelA-1; Wed, 27 Apr 2022 08:36:33 -0400
X-MC-Unique: dkoEzHd2MHOLVZdca5RelA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7C2F3838C84;
	Wed, 27 Apr 2022 12:36:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C515A40CF8FD;
	Wed, 27 Apr 2022 12:36:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 12AE41947046;
	Wed, 27 Apr 2022 12:36:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D7361947041 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Apr 2022 12:29:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7858B9D54; Wed, 27 Apr 2022 12:29:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 744C517586
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 12:29:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 181281C06905
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 12:29:33 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-TrvXC_4FOmmDc08vWoZ-rg-1; Wed, 27 Apr 2022 08:29:32 -0400
X-MC-Unique: TrvXC_4FOmmDc08vWoZ-rg-1
Received: by mail-wr1-f72.google.com with SMTP id
 n17-20020adfc611000000b0020a7e397ccaso681162wrg.23
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 05:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3NajTnxfaXiUWEWzwoSS9j+6RIZ90UuUICFGJF5sxU=;
 b=qf5JFSF/mJFgh8hrgtjqFw17xIAaVaAmvx7GJf1jtmTSvHoY1NI1K++gnGjXIujL81
 wXxhy0k5f5riaT0yYFwVeqBE5M1GglPV2m9WeFllUTRsob/QhbV3p2RFNxHhH5V5LFv1
 AF/O+VpWcV7N5zAtd2Yb5eHyXXexmcw8BKOV7I7yX/GJijfUGxOWMKITpNkVmk77ihvR
 jewHoxeHjHnsdp7nauFrp6KnSueTQOmkCO8VxUE8NuOtOsqRP7faDqCdifPCvtjOdSan
 6e5xhc2FNBCPb0uKcRXSqnCgQzA1LLCpbWz+hFKEiR0hZY04+XQz7a2vFK+ygnmSHKN6
 6VMw==
X-Gm-Message-State: AOAM532JP0AZ1VKr+YKwUKBvbbR+j9x+q/cd89H20rgmfZsKdaMWFHVE
 JER3endvcvjDuBHexrPbuQSCVi0FCu6O6lgsz0qFPIUkT2saGVOc4m/ZNrmctvdZFWTYOnDu6U0
 fKY+xsqlpDrbpNQ1waKCChBaqdkPMxmL7JJ0noQ==
X-Received: by 2002:a05:6000:712:b0:20a:e5ee:2310 with SMTP id
 bs18-20020a056000071200b0020ae5ee2310mr6763128wrb.349.1651062570342; 
 Wed, 27 Apr 2022 05:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2NwbomRB7oo5qB43mxERhmhA3DTKd91/iW0YBKGD5MzZODgFS2GGN77/iu24+f+xVUoV7Vyi36xCRLTKBGqU=
X-Received: by 2002:a05:6000:712:b0:20a:e5ee:2310 with SMTP id
 bs18-20020a056000071200b0020ae5ee2310mr6763112wrb.349.1651062570075; Wed, 27
 Apr 2022 05:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
In-Reply-To: <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 27 Apr 2022 14:29:18 +0200
Message-ID: <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 1:33 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Apr 26, 2022 at 2:28 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > Btrfs has a comment in that place that reads:
> >
> >     /* No increment (+=) because iomap returns a cumulative value. */
>
> What a truly horrid interface. But you are triggering repressed
> childhood memories:
>
> > That's so that we can complete the tail of an asynchronous write
> > asynchronously after a failed page fault and subsequent fault-in.
>
> yeah, that makes me go "I remember something like that".
>
> > That would be great, but applications don't seem to be able to cope
> > with short direct writes, so we must turn partial failure into total
> > failure here. There's at least one xfstest that checks for that as
> > well.
>
> What a complete crock. You're telling me that you did some writes, but
> then you can't tell user space that writes happened because that would
> confuse things.
>
> Direct-IO is some truly hot disgusting garbage.
>
> Happily it's only used for things like databases that nobody sane
> would care about anyway.
>
> Anyway, none of that makes any sense, since you do this:
>
>                 ret = gfs2_file_direct_write(iocb, from, &gh);
>                 if (ret < 0 || !iov_iter_count(from))
>                         goto out_unlock;
>
>                 iocb->ki_flags |= IOCB_DSYNC;
>                 buffered = gfs2_file_buffered_write(iocb, from, &gh);
>
> so you're saying that the direct write will never partially succeed,
> but then in gfs2_file_write_iter() it very much looks like it's
> falling back to buffered writes for that case.
>
> Hmm. Very odd.
>
> I assume this is all due to that
>
>         /* Silently fall back to buffered I/O when writing beyond EOF */
>         if (iocb->ki_pos + iov_iter_count(from) > i_size_read(&ip->i_inode))
>
> thing, so this all makes some perverse kind of sense, but it still
> looks like this code just needs some serious serious commentary.

Yes, that, as well as writing into holes.

During direct writes, gfs2 is holding the inode glock in a special
"shared writable" mode which works like the usual "shared readable"
mode as far as metadata goes, but can be held by multiple "shared
writers" at the same time. This allows multiple nodes to write to the
storage device concurrently as long as the file is preallocated (i.e.,
databases). When it comes to allocations, it falls back to "exclusive"
locking and buffered writes.

> So you *can* have a partial write if you hit the end of the file, and
> then you'll continue that partial write with the buffered code.
>
> But an actual _failure_ will not do that, and instead return an error
> even if the write was partially done.
>
> But then *some* failures aren't failures at all, and without any
> comments do this
>
>         if (ret == -ENOTBLK)
>                 ret = 0;
>
>
> And remind me again - this all is meant for applications that
> supposedly care about consistency on disk?
>
> And the xfs tests actually have a *test* for that case, to make sure
> that nobody can sanely *really* know how much of the write succeeded
> if it was a DIO write?
>
> Gotcha.

I agree that it's pretty sad.

> > > The reason I think I'm full of sh*t is that you say that the problem
> > > occurs in gfs2_file_buffered_write(), not in that
> > > gfs2_file_direct_write() case.
> >
> > Right, we're having that issue with buffered writes.
>
> I have to say, compared to all the crazy things I see in the DIO path,
> the buffered write path actually looks almost entirely sane.
>
> Of course, gfs2_file_read_iter() counts how many bytes it has read in
> a variable called 'written', and gfs2_file_buffered_write() counts the
> bytes it has written in a variable called 'read', so "entirely sane"
> is all very very relative.
>
> I'm sure there's some good reason (job security?) for all this insanity.

Point taken; I'll fix this up.

> But I now have to go dig my eyes out with a rusty spoon.
>
> But before I do that, I have one more question (I'm going to regret
> this, aren't I?):
>
> In gfs2_file_buffered_write(), when it has done that
> fault_in_iov_iter_readable(), and it decides that that succeeded, it
> does
>
>                         if (gfs2_holder_queued(gh))
>                                 goto retry_under_glock;
>                         if (read && !(iocb->ki_flags & IOCB_DIRECT))
>                                 goto out_uninit;
>                         goto retry;
>
> so if it still has that lock (if I understand correctly), it will always retry.
>
> But if it *lost* the lock, it will retry only if was a direct write,
> and return a partial success for a regular write() rather than
> continue the write.
>
> Whaa? I'm assuming that this is more of that "direct writes have to
> succeed fully or not at all", but according to POSIX *regular* writes
> should also succeed fully, unless some error happens.
>
> Losing the lock doesn't sound like an error to me.

Regular (buffered) reads and writes are expected to be atomic with
respect to each other. That atomicity comes from holding the lock.
When we lose the lock, we can observe atomicity and return a short
result, ignore atomicity and return the full result, or retry the
entire operation. Which of those three options would you prefer?

For what it's worth, none of this matters as long as there's no lock
contention across the cluster.

> And there are a lot of applications that do assume "write to a regular
> file didn't complete fully means that the disk is full" etc. Because
> that's the traditional meaning.
>
> This doesn't seem to be related to any data corruption issue, but it does smell.
>
>              Linus

Thanks,
Andreas

