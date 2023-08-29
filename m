Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E71A78C4FB
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 15:17:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693315072;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=K/kvl9u3Q/dPeMvE2AMCbtsJRkbDSW6Aku9zvQLvGJ8=;
	b=LUX5vvRkKZhYsVVjXUb7PUfZN6XXFKQkbqEFKtEy8EVPaag5C5EKHem3O7KEYnn/AgcbI9
	fzXbjAduRP1hCfvhmvLbQW6akFKQuJz4C03ipMicH/JieHmND4Il5yyTHRZSaQwbk/ZDkJ
	Hz9jn7Xfn3NL/Vm9ts/zMJmqo7dsilM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-690-o4UjOrWY17GGxj1edQ-1; Tue, 29 Aug 2023 09:17:49 -0400
X-MC-Unique: 690-o4UjOrWY17GGxj1edQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D3328EC102;
	Tue, 29 Aug 2023 13:17:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E97C2492C13;
	Tue, 29 Aug 2023 13:17:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 964B719465BA;
	Tue, 29 Aug 2023 13:17:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0C8DE19465B3 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 13:17:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF1A72026D76; Tue, 29 Aug 2023 13:17:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6F672026D68
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 13:17:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E2D381C16C
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 13:17:45 +0000 (UTC)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-ZhRRA_EaPkKMOKnpQEVohw-1; Tue, 29 Aug 2023 09:17:41 -0400
X-MC-Unique: ZhRRA_EaPkKMOKnpQEVohw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2bd09fdec5cso27979411fa.1
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 06:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693315059; x=1693919859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/kvl9u3Q/dPeMvE2AMCbtsJRkbDSW6Aku9zvQLvGJ8=;
 b=OmX/TtWPwagUeK8UPl69M6+4UBPuOXMqftYRu8onX/43PQD1ZPJ7QwvKZK77tCkkhD
 tzzWBBo8kB8S7iL8SeIoupZ1wmZsw7UNW8OGQSo84N7CoORcCvej5T4RoRU9cw1C7Ftq
 2SGYImQ5c3jJZDHXawUZI/XXUB+ytYRbDr0/IHFckI4BhU9f5i4kMyazcHPooy8VjZZi
 bMSjLMPTWPjXLaBstm2zEbM9HiF+fE7Xe/ZJA711zwv7ny2Vfl3ah80CDBAdA92q87YK
 tvmR3QPKY3jZfB/dBPNEJSYLY7BdX6qyzqexvP+lTiagXGXEmpcw1f3qPsqPvelI2xg5
 BpXg==
X-Gm-Message-State: AOJu0YwOiAuZldtqDzSirAGQpT0QPEa5OXXXkMlEYWiMYW9lxDP5RwGL
 vRWl7AsC9RvAWnmZcl6XJ5s2/OBMlJK6Xm8H6Yqv9xY6Y6N39PyYqAYAMafPgk35nYNX79Pu+h+
 jKlIbF1VusYE2u9FGVLPFVOneZkrJmQwj7Iz8sC8cVxaCbA==
X-Received: by 2002:a05:6512:20c7:b0:500:a08e:2fcf with SMTP id
 u7-20020a05651220c700b00500a08e2fcfmr10277082lfr.47.1693315059260; 
 Tue, 29 Aug 2023 06:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHeegyfxaonQumPzYUiTed8ngQep5lCbcKcd67qC9HLybaJW8N7y+lXmQn2shHt2qmm3Mh/UAtivBipGNu71M=
X-Received: by 2002:a05:6512:20c7:b0:500:a08e:2fcf with SMTP id
 u7-20020a05651220c700b00500a08e2fcfmr10277053lfr.47.1693315058825; Tue, 29
 Aug 2023 06:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230823210814.1838129-1-aahringo@redhat.com>
 <20230829044309.wdazieha4yvbnkq4@zlang-mailbox>
In-Reply-To: <20230829044309.wdazieha4yvbnkq4@zlang-mailbox>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 29 Aug 2023 09:17:27 -0400
Message-ID: <CAK-6q+hzj615f8_je+EYOwAh=ezL361fpuNhj3yoow+cpRKC9w@mail.gmail.com>
To: Zorro Lang <zlang@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] generic: add fcntl corner cases tests
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
Cc: cluster-devel@redhat.com, jlayton@kernel.org, fstests@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 29, 2023 at 12:43=E2=80=AFAM Zorro Lang <zlang@redhat.com> wrot=
e:
>
> On Wed, Aug 23, 2023 at 05:08:14PM -0400, Alexander Aring wrote:
> > This patch adds generic 730 testcase. It will test on various fcntl()
>
> The generic/730 has been taken. The case number might be changed when I m=
erge
> a patch, so you don't need to specify a fixed number in commit log or com=
ments.
>

ok. Thanks.

> > corner cases that was making problems on a GFS2 filesystem. GFS2 has
> > it's own lock() implementation that has it's own posix lock
> > implementation behind it. There are testcases to find issues with struc=
t
> > file_lock matches. Currently the Linux kernel does not have a unique
> > identifier per lock request to e.g. find the original lock request when
> > a complete handler of an async lock request comes back. The current way
> > is to use struct file_lock fields to fine the original lock request.
> > However there was issues being found that in some cases it wasn't an
> > unique match because multiple pending struct file_lock could have the
> > same state. To find issues the testcases fcntl_lock_equal_file_lock and
> > fcntl_lock_same_owner are introduced and their OFD variants.
> >
> > Other test like fcntl_lock_kill_child tests cleanup routines when a
> > process blocking in F_SETLKW to wait the lock request getting granted
> > and the process gets killed.
> >
> > A similar test is fcntl_lock_signal_interrupt which checks for
> > side-effects e.g. unlock all previous acquired locks when a blocking
> > F_SETLKW gets interrupted by a signal.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
> > ---
>
> Is there a known issue cause a deadlock or something else? I tried to run=
 this
> case on XFS, but it's always blocked on fcntl_lock_same_owner test[1], ev=
en 1
> day passed, it's still there.
>

Mhh, I can reproduce it and it should not happen. I messed something
up with the same owner test cases to unlock other locks on cleanup.

> [1]
> [root@xxxxxx ~]# ps aux|grep fcntl
> root       72361  0.0  0.0   3056  1536 pts/1    S+   12:10   0:00 /root/=
git/xfstests/src/fcntl_lock_same_owner /mnt/test/testfile
> root       72362  0.0  0.0  19580  1280 pts/1    Sl+  12:10   0:00 /root/=
git/xfstests/src/fcntl_lock_same_owner /mnt/test/testfile
> root       72405  0.0  0.0   6760  2048 pts/2    S+   12:12   0:00 grep -=
-color=3Dauto fcntl
> [root@xxxxxx ~]# cat /proc/72361/stack
> [<0>] do_wait+0x160/0x2f0
> [<0>] kernel_wait4+0xb8/0x160
> [<0>] __do_sys_wait4+0xa2/0xb0
> [<0>] do_syscall_64+0x60/0x90
> [<0>] entry_SYSCALL_64_after_hwframe+0x73/0xdd
> [root@xxxxxx ~]# cat /proc/72362/stack
> [<0>] futex_wait_queue+0x63/0x90
> [<0>] futex_wait+0x189/0x270
> [<0>] do_futex+0xc6/0x190
> [<0>] __x64_sys_futex+0x129/0x1e0
> [<0>] do_syscall_64+0x60/0x90
> [<0>] entry_SYSCALL_64_after_hwframe+0x73/0xdd
>
>
> >  src/Makefile                         |   5 +-
> >  src/fcntl_lock_equal_file_lock.c     | 140 +++++++++++++++++++++++
> >  src/fcntl_lock_equal_file_lock_ofd.c | 144 ++++++++++++++++++++++++
> >  src/fcntl_lock_kill_child.c          | 148 +++++++++++++++++++++++++
> >  src/fcntl_lock_same_owner.c          | 146 ++++++++++++++++++++++++
> >  src/fcntl_lock_same_owner_ofd.c      | 144 ++++++++++++++++++++++++
> >  src/fcntl_lock_signal_interrupt.c    | 159 +++++++++++++++++++++++++++
> >  tests/generic/730                    |  70 ++++++++++++
> >  tests/generic/730.out                |   2 +
>
> The g/730 has been taken.
>
> >  9 files changed, 957 insertions(+), 1 deletion(-)
> >  create mode 100644 src/fcntl_lock_equal_file_lock.c
> >  create mode 100644 src/fcntl_lock_equal_file_lock_ofd.c
> >  create mode 100644 src/fcntl_lock_kill_child.c
> >  create mode 100644 src/fcntl_lock_same_owner.c
> >  create mode 100644 src/fcntl_lock_same_owner_ofd.c
> >  create mode 100644 src/fcntl_lock_signal_interrupt.c
> >  create mode 100755 tests/generic/730
> >  create mode 100644 tests/generic/730.out
> >
>
> [snip]
>
> > diff --git a/src/fcntl_lock_same_owner.c b/src/fcntl_lock_same_owner.c
> > new file mode 100644
> > index 00000000..071a3b49
> > --- /dev/null
> > +++ b/src/fcntl_lock_same_owner.c
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * This program tests fcntl() operations that have two
> > + * fcntl() calls in waiting state in two different threads.
> > + * Those fcntl() ends in a struct file_lock have the same fl_owner
> > + * field. One fcntl() call gets granted, there will be a verifier
> > + * going on if the right lock was granted.
> > + */
> > +
> > +#include <sys/wait.h>
> > +#include <pthread.h>
> > +#include <unistd.h>
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <stdio.h>
> > +
> > +static const char *filename;
> > +static int fd;
> > +
> > +static void *do_same_owner_thread0(void *arg)
> > +{
> > +     struct flock fl =3D {
> > +             .l_type =3D F_WRLCK,
> > +             .l_whence =3D SEEK_SET,
> > +             .l_start =3D 0L,
> > +             .l_len =3D 1L,
> > +     };
> > +     int rv;
> > +
> > +     rv =3D fcntl(fd, F_SETLKW, &fl);
> > +     if (rv =3D=3D -1)
> > +             _exit(1);
> > +
> > +     return NULL;
> > +}
> > +
> > +static void *do_same_owner_thread1(void *arg)
> > +{
> > +     struct flock fl =3D {
> > +             .l_type =3D F_WRLCK,
> > +             .l_whence =3D SEEK_SET,
> > +             .l_start =3D 1L,
> > +             .l_len =3D 1L,
> > +     };
> > +     int rv;
> > +
> > +     rv =3D fcntl(fd, F_SETLKW, &fl);
> > +     if (rv =3D=3D -1)
> > +             _exit(1);
> > +
> > +     return NULL;
> > +}
> > +
> > +static void do_setup()
> > +{
> > +     fd =3D open(filename, O_RDWR | O_CREAT, 0700);
> > +     if (fd =3D=3D -1)
> > +             _exit(1);
> > +}
> > +
> > +static void do_teardown()
> > +{
> > +     close(fd);
> > +}
> > +
> > +static void do_same_owner()
> > +{
> > +     struct flock fl =3D {
> > +             .l_type =3D F_WRLCK,
> > +             .l_whence =3D SEEK_SET,
> > +             .l_start =3D 0L,
> > +             .l_len =3D 2L,
> > +     };
> > +     pthread_t t[2];
> > +     int pid, rv;
> > +
> > +     rv =3D fcntl(fd, F_SETLK, &fl);
> > +     if (rv =3D=3D -1)
> > +             _exit(1);
> > +
> > +     pid =3D fork();
> > +     if (pid =3D=3D 0) {
> > +             rv =3D pthread_create(&t[0], NULL, do_same_owner_thread0,=
 NULL);
> > +             if (rv !=3D 0)
> > +                     _exit(1);
> > +
> > +             rv =3D pthread_create(&t[1], NULL, do_same_owner_thread1,=
 NULL);
> > +             if (rv !=3D 0)
> > +                     _exit(1);
> > +
> > +             pthread_join(t[0], NULL);
> > +             pthread_join(t[1], NULL);
> > +
> > +             _exit(0);
> > +     }
> > +
> > +     /* wait threads should block */
> > +     sleep(3);
> > +
> > +     fl.l_type =3D F_UNLCK;
> > +     fl.l_start =3D 1;
> > +     fl.l_len =3D 1;
> > +     rv =3D fcntl(fd, F_SETLK, &fl);
> > +     if (rv =3D=3D -1)
> > +             _exit(1);
> > +
> > +     sleep(3);
> > +
> > +     /* check if the lock() implementation got the
> > +      * right lock because two waiter with the
> > +      * same fl_owner were waiting.
> > +      */
> > +     fl.l_type =3D F_WRLCK;
> > +     rv =3D fcntl(fd, F_SETLK, &fl);
> > +     if (!(rv =3D=3D -1 && errno =3D=3D EAGAIN))
> > +             _exit(1);
> > +
> > +     fl.l_type =3D F_UNLCK;
> > +     fl.l_start =3D 1;

need to be 0.

> > +     fl.l_len =3D 1;
> > +     rv =3D fcntl(fd, F_SETLK, &fl);
> > +     if (rv =3D=3D -1)
> > +             _exit(1);
> > +
> > +     wait(NULL);
> > +}
> > +
> > +static void usage(const char *argv0)
> > +{
> > +     fprintf(stderr, "Usage: %s {filename}\n", argv0);
> > +     _exit(1);
> > +}
> > +
> > +int main(int argc, const char *argv[])
> > +{
> > +     if (argc !=3D 2)
> > +             usage(argv[0]);
> > +
> > +     filename =3D argv[1];
> > +
> > +     do_setup();
> > +     do_same_owner();
> > +     do_teardown();
> > +
> > +     return 0;
> > +}
>
> [snip]
>
> > diff --git a/tests/generic/730 b/tests/generic/730
> > new file mode 100755
> > index 00000000..4a1e7f20
> > --- /dev/null
> > +++ b/tests/generic/730
> > @@ -0,0 +1,70 @@
> > +#! /bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright (c) 2023 Alexander Aring.  All Rights Reserved.
> > +#
> > +# FS QA Test 730
> > +#
> > +# This tests performs some fcntl() corner cases when
> > +# two waiter have the same or some (fl_owner) fields. In Linux
> > +# there exists no unique lock request identifier, some lock()
> > +# filesystem implementation does that over struct file_lock fields.
> > +# Other tests check for bad side-effects if a blocking F_SETLKW lock
> > +# request got interrupted or the process got killed.
> > +#
> > +. ./common/preamble
> > +_begin_fstest auto quick
> > +
> > +# Import common functions.
> > +. ./common/filter
> > +
> > +# real QA test starts here
> > +
> > +_supported_fs generic
> > +_require_test
> > +_require_test_program fcntl_lock_equal_file_lock
> > +_require_test_program fcntl_lock_equal_file_lock_ofd
> > +_require_test_program fcntl_lock_kill_child
> > +_require_test_program fcntl_lock_same_owner
> > +_require_test_program fcntl_lock_same_owner_ofd
> > +_require_test_program fcntl_lock_signal_interrupt
>
> Does these test programs try to do different test? You might want to
> split them to seperated generic cases, or combine these .c into
> one program?
>

The tests are different in case of what struct file_lock * of
vfs_file_lock() looks like. The kernel does a lot of lookups by
file_lock fields, I am trying to catch issues with locks around which
have identical fields.

I think "same_owner" can be removed, "equal file lock" is what we need
to test on only. It does generate a file_lock which mostly looks
identically. If there are issues with identical fl_owner values,
"equal_file_lock" should catch them as well.

The OFD variants are there, because of showing that if there is a
problem OFD locks are also affected by doing "stupid" things on the
application. In my opinion they can be removed as well because it just
do the same thing as the non OFD variants with threads... There is
just a different pattern of how to create them and run in a similar
issue.

The kill_child/signal interrupt are tests which check on the right
cleanup routines, if such a case happens.

I will try to short (also fixing) them and combine them in one .c program.

> > +
> > +echo "Silence is golden"
> > +
> > +$here/src/fcntl_lock_equal_file_lock $TEST_DIR/testfile
> > +if [ $? -ne 0 ]
> > +then
> > +     exit
>
> So it's still the question, does these programs test independently or the=
y
> have progressive relationship? When a test fails, should we test others o=
r
> ignore others directly?
>

Probably not running other because if one test fails it could be that
the POSIX lockstates are in some kind of invalid state, I experience
this with GFS2 and following tests will fail or at least not starting
from a clean lockstate environment.

> And is there more debug info output if a test fails? To figure out which =
test
> fails and fail on where? From above .c programs, I didn't see some design=
ed
> printf, and if we exit directly at here, how to know which test fails?
>

ok. I can add more debug information. I am not sure what to put them
into a $TESTFILE.out file but I will try to look it up on other test
cases.

Thanks.

- Alex

