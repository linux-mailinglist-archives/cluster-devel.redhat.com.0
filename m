Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3757C74D74F
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Jul 2023 15:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688995227;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BV4nji85a+mPY3kj67G42V3oBEYwbWqct70gcMhmixM=;
	b=E2LBPoc8M5H5NW9WyfvJoIfhyBcM8QS8QTiVe1vtmZMW7xYdPjgP5PNrzbDwo3Wg+8eLfk
	UN3Ae5jKYwu+pC+vOgD2VZ55f/kmeB3eWO8YqmdftJrzLgigM8K74CpRhP4DBAstbbUUPn
	kd0PveFDW5Qr8d9LFkuBhSM1fKLzY/Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-Lc3f-0xWPmi5a4BXQuzptQ-1; Mon, 10 Jul 2023 09:20:23 -0400
X-MC-Unique: Lc3f-0xWPmi5a4BXQuzptQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96B6418A6461;
	Mon, 10 Jul 2023 13:20:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60070145414C;
	Mon, 10 Jul 2023 13:20:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA99719465B5;
	Mon, 10 Jul 2023 13:20:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D393C194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Jul 2023 13:20:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1AF62017DCB; Mon, 10 Jul 2023 13:20:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB23207B31F
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 13:20:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 808BD3815F77
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 13:20:08 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513--pV0BtJUO9iWgYZ0DVMIjg-1; Mon, 10 Jul 2023 09:20:07 -0400
X-MC-Unique: -pV0BtJUO9iWgYZ0DVMIjg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1b9de135bddso14649735ad.3
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 06:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688995206; x=1691587206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BV4nji85a+mPY3kj67G42V3oBEYwbWqct70gcMhmixM=;
 b=Swoeb48HJ7tGEStBrLvGhkQn6Cwf55YRuRwbE2GOpdgQ6RhTX47iaMq9pJusLA7E7/
 9XFfP0hTIdsweAidC5tAWRJCEZ463mm8fr7SMFEMHtsE7qinxdPfrONIKqXShkWpIKlw
 8zEL7cu5tHnS7eEUhbVqeFg7OoV7fARO87dKpsYZhGBNt9L/eE7eYAkTUOx1tJhBUrxG
 Uu2TFatz/kobv7OVh3ik3gagMlG3uK4lmpimVYyO3zXkABQmSZCUgQaaBaGRKdMKeOJR
 JO7Ajv8KrfRnAAxhow5iAVHE0enNRr88/DvmHeG+zGlpZyGyqR41gSLHWBgmX1cnVVKC
 3iIw==
X-Gm-Message-State: ABy/qLYv827JRjJz5tW/rs2yrPrFy1q6mNLWWTpZg6l4TAf/ZlEBu6D4
 gdYGPBrHn8fGSKZoOzdYAp2jMahZZm8SoQcpOHE9yNpx3tYB+rZOq8qvgOyLasWtuGKD0IAT+7s
 Drn8pHD4HS3BqV8RLQD5Rqt2YBvu3SvyruJFYqA==
X-Received: by 2002:a17:902:7003:b0:1b3:d4ed:8306 with SMTP id
 y3-20020a170902700300b001b3d4ed8306mr10048104plk.19.1688995206246; 
 Mon, 10 Jul 2023 06:20:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG8SeibqeafomP0ohyldI7j5j7dJgFlJrmuNkW6V0W3Pc+EoS6medukPetid8d+FD0HSmKSEh57NmZCbZ2N7rM=
X-Received: by 2002:a17:902:7003:b0:1b3:d4ed:8306 with SMTP id
 y3-20020a170902700300b001b3d4ed8306mr10048091plk.19.1688995205937; Mon, 10
 Jul 2023 06:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230523085929.614A.409509F4@e16-tech.com>
 <20230528235314.7852.409509F4@e16-tech.com>
In-Reply-To: <20230528235314.7852.409509F4@e16-tech.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 10 Jul 2023 15:19:54 +0200
Message-ID: <CAHc6FU5YYADEE1m2skcZxOb5fC24JDcJvHtBoq6ZCttB3BhObA@mail.gmail.com>
To: Wang Yugui <wangyugui@e16-tech.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] gfs2 write bandwidth regression on 6.4-rc3
 compareto 5.15.y
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
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wang Yugui,

On Sun, May 28, 2023 at 5:53=E2=80=AFPM Wang Yugui <wangyugui@e16-tech.com>=
 wrote:
> Hi,
>
> > Hi,
> >
> > gfs2 write bandwidth regression on 6.4-rc3 compare to 5.15.y.
> >
> > we added  linux-xfs@ and linux-fsdevel@ because some related problem[1]
> > and related patches[2].
> >
> > we compared 6.4-rc3(rather than 6.1.y) to 5.15.y because some related p=
atches[2]
> > work only for 6.4 now.
> >
> > [1] https://lore.kernel.org/linux-xfs/20230508172406.1CF3.409509F4@e16-=
tech.com/
> > [2] https://lore.kernel.org/linux-xfs/20230520163603.1794256-1-willy@in=
fradead.org/
> >
> >
> > test case:
> > 1) PCIe3 SSD *4 with LVM
> > 2) gfs2 lock_nolock
> >     gfs2 attr(T) GFS2_AF_ORLOV
> >    # chattr +T /mnt/test
> > 3) fio
> > fio --name=3Dglobal --rw=3Dwrite -bs=3D1024Ki -size=3D32Gi -runtime=3D3=
0 -iodepth 1
> > -ioengine sync -zero_buffers=3D1 -direct=3D0 -end_fsync=3D1 -numjobs=3D=
1 \
> >       -name write-bandwidth-1 -filename=3D/mnt/test/sub1/1.txt \
> >       -name write-bandwidth-2 -filename=3D/mnt/test/sub2/1.txt \
> >       -name write-bandwidth-3 -filename=3D/mnt/test/sub3/1.txt \
> >       -name write-bandwidth-4 -filename=3D/mnt/test/sub4/1.txt
> > 4) patches[2] are applied to 6.4-rc3.
> >
> >
> > 5.15.y result
> >       fio WRITE: bw=3D5139MiB/s (5389MB/s),
> > 6.4-rc3 result
> >       fio  WRITE: bw=3D2599MiB/s (2725MB/s)
>
> more test result:
>
> 5.17.0  WRITE: bw=3D4988MiB/s (5231MB/s)
> 5.18.0  WRITE: bw=3D5165MiB/s (5416MB/s)
> 5.19.0  WRITE: bw=3D5511MiB/s (5779MB/s)
> 6.0.5   WRITE: bw=3D3055MiB/s (3203MB/s), WRITE: bw=3D3225MiB/s (3382MB/s=
)
> 6.1.30  WRITE: bw=3D2579MiB/s (2705MB/s)
>
> so this regression  happen in some code introduced in 6.0,
> and maybe some minor regression in 6.1 too?

thanks for this bug report. Bob has noticed a similar looking
performance regression recently, and it turned out that commit
e1fa9ea85ce8 ("gfs2: Stop using glock holder auto-demotion for now")
inadvertently caused buffered writes to fall back to writing single
pages instead of multiple pages at once. That patch was added in
v5.18, so it doesn't perfectly align with the regression history
you're reporting, but maybe there's something else going on that we're
not aware of.

In any case, the regression introduced by commit e1fa9ea85ce8 should
be fixed by commit c8ed1b359312 ("gfs2: Fix duplicate
should_fault_in_pages() call"), which ended up in v6.5-rc1.

Could you please check where we end up with that fix?

Thank you very much,
Andreas

