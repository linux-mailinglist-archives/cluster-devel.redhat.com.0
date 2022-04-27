Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB1512480
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Apr 2022 23:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651094805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AB2AzJJ8IjGoSjnbfQx30F7f0GbMWPGLsvloPQDw8ac=;
	b=bb/Pd2oAa99lFSf28U2cHNLFu8hJ5YAaGcMZyAvJgjNyfPJ69Z8HodtQm6HYpVY01S+IKQ
	lRhgZhQnuQQDBA2gNnC0W5Ex4cVnQ8ZBHjS1ISAO41JCRRvcGSg8f4f+ZbdWdMPjv8M+nf
	/qD8spBGJnv0chqRBpAz6SIgxU806xw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-qSdkUQizPKeYIfLBSxb0XA-1; Wed, 27 Apr 2022 17:26:42 -0400
X-MC-Unique: qSdkUQizPKeYIfLBSxb0XA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F39B38001EA;
	Wed, 27 Apr 2022 21:26:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22464C33B13;
	Wed, 27 Apr 2022 21:26:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8BA111947048;
	Wed, 27 Apr 2022 21:26:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5BF7E1947041 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 27 Apr 2022 21:26:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C9F914682E2; Wed, 27 Apr 2022 21:26:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4929314682D7
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 21:26:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E87429AA2F0
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 21:26:39 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-sKQFM8kXNKa0ic_b4_iNPQ-1; Wed, 27 Apr 2022 17:26:37 -0400
X-MC-Unique: sKQFM8kXNKa0ic_b4_iNPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso1172170wme.1
 for <cluster-devel@redhat.com>; Wed, 27 Apr 2022 14:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AB2AzJJ8IjGoSjnbfQx30F7f0GbMWPGLsvloPQDw8ac=;
 b=KwHCiCcTA2BRa3NKohaTE31pIOcYnNvcM/lWoHGyPU1YT12+2UNWWRAmVS7XR5HcPV
 CzAoelfG1ornhGZiTorapID2u+zcQjdNKdnm15hh91pbFJAZ4co7PYeQwkwD0HRz75e/
 d/i7T7y3YYARMuBw85ritjRMPK5IhMDP8kOGpNJayVxJudmqDckxfULtAULDZJiM8cP5
 DXFwDH/RVvoUUMwspEdO8W31rJkxetBHh+fRPIe62bH16w04FgRapIPCY41dwuQFWKXB
 Kx5ZkkOEgZMFlglkxagCs5ogeX5dRINJC+wUDb0X1e6VOZFC02ut1dJ8Xn/+DsNWLsWC
 /FPg==
X-Gm-Message-State: AOAM532Zig9in/IK5cKlvH7T+e5l/FV3tynTcakCvgBWeLBM5DdfofWY
 xIRZNBB1xU7vYiTn8rsn69ykuoTMiC204t3K5lX6Q0ZbCAZN+6R/9dZ6XgHwbLc9R8AU/mXeqif
 Oy2RRkBOg9eoseUBOTviYVY/7Dmq8tfTJhkrOWA==
X-Received: by 2002:a5d:4b0d:0:b0:20a:f3d9:336e with SMTP id
 v13-20020a5d4b0d000000b0020af3d9336emr1727600wrq.467.1651094796135; 
 Wed, 27 Apr 2022 14:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfF0F/O5mtxoKKsietIrkPmZm5qUDbCRczQudsCfphucBocKFEsXyrVgqBJN5m4mn3cJF1U0v52FtCk2cx/QY=
X-Received: by 2002:a5d:4b0d:0:b0:20a:f3d9:336e with SMTP id
 v13-20020a5d4b0d000000b0020af3d9336emr1727590wrq.467.1651094795879; Wed, 27
 Apr 2022 14:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
 <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
 <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
In-Reply-To: <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 27 Apr 2022 23:26:24 +0200
Message-ID: <CAHc6FU69E4ke4Xg3zQ2MqjLbfM65D9ZajdY5MRDLN0azZOGmVQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 10:26 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Wed, Apr 27, 2022 at 12:41 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > I wonder if this could be documented in the read and write manual
> > pages. Or would that be asking too much?
>
> I don't think it would be asking too much, since it's basically just
> describing what Linux has always done in all the major filesystems.
>
> Eg look at filemap_read(), which is basically the canonical read
> function, and note how it doesn't take a single lock at that level.
>
> We *do* have synchronization at a page level, though, ie we've always
> had that page-level "uptodate" bit, of course (ok, so "always" isn't
> true - back in the distant past it was the 'struct buffer_head' that
> was the synchronization point).
>
> That said, even that is not synchronizing against "new writes", but
> only against "new creations" (which may, of course, be writers, but is
> equally likely to be just reading the contents from disk).
>
> That said:
>
>  (a) different filesystems can and will do different things.
>
> Not all filesystems use filemap_read() at all, and even the ones that
> do often have their own wrappers. Such wrappers *can* do extra
> serialization, and have their own rules. But ext4 does not, for
> example (see ext4_file_read_iter()).
>
> And as mentioned, I *think* XFS honors that old POSIX rule for
> historical reasons.
>
>  (b) we do have *different* locking
>
> for example, we these days do actually serialize properly on the
> file->f_pos, which means that a certain *class* of read/write things
> are atomic wrt each other, because we actually hold that f_pos lock
> over the whole operation and so if you do file reads and writes using
> the same file descriptor, they'll be disjoint.
>
> That, btw, hasn't always been true. If you had multiple threads using
> the same file pointer, I think we used to get basically random
> results. So we have actually strengthened our locking in this area,
> and made it much better.
>
> But note how even if you have the same file descriptor open, and then
> do pread/pwrite, those can and will happen concurrently.
>
> And mmap accesses and modifications are obviously *always* concurrent,
> even if the fault itself - but not the accesses - might end up being
> serialized due to some filesystem locking implementation detail.
>
> End result: the exact serialization is complex, depends on the
> filesystem, and is just not really something that should be described
> or even relied on (eg that f_pos serialization is something we do
> properly now, but didn't necessarily do in the past, so ..)
>
> Is it then worth pointing out one odd POSIX rule that basically nobody
> but some very low-level filesystem people have ever heard about, and
> that no version of Linux has ever conformed to in the main default
> filesystems, and that no user has ever cared about?

Well, POSIX explicitly mentions those atomicity expectations, e.g.,
for read [1]:

  "I/O is intended to be atomic to ordinary files and pipes and FIFOs. Atomic
  means that all the bytes from a single operation that started out together
  end up together, without interleaving from other I/O operations."

Users who hear about it from POSIX are led to assume that this atomic
behavior is "real", and the Linux man pages do nothing to rob them of
that illusion. They do document that the file offset aspect has been
fixed though, which only makes things more confusing.

So from that point of view, I think it would be worthwhile to mention
that most if not all filesystems ignore the "non-interleaving" aspect.

[1] https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/read.html
[2] https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/write.html
[3] https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/functions/V2_chap02.html#tag_15_09_07

Thanks,
Andreas

