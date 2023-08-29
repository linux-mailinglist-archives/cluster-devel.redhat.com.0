Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146978BD8E
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 06:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693284203;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YFFOFeo2nXrYY+u6CA20+fq28ZSwwsl5cEOIz2/SyD0=;
	b=EnWHRMR5OEN2OF0GHb12CNfWFISgKSW2Mg68hnF/DA33JkSwl4vZFjdGcpVUzGUa/MVvfb
	+/Hs9/1l+FYt6Y44K2XklnLyTkfjw+fjSy6cbiRr5ZhlUa3xxdXMX6B+YImNBDbMT51g8V
	5qztB9HPgP2e96o0w5bkon6BFbPJCG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-vM_4_rXzNBatmANgcK0iUA-1; Tue, 29 Aug 2023 00:43:19 -0400
X-MC-Unique: vM_4_rXzNBatmANgcK0iUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8718185A78F;
	Tue, 29 Aug 2023 04:43:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68C140C2070;
	Tue, 29 Aug 2023 04:43:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91C5D19465B9;
	Tue, 29 Aug 2023 04:43:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BEC141946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 04:43:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 981554021C9; Tue, 29 Aug 2023 04:43:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9039A4021C8
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 04:43:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C2F9101A528
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 04:43:16 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-EDqmC-YvPIa-0NBvmfADew-1; Tue, 29 Aug 2023 00:43:14 -0400
X-MC-Unique: EDqmC-YvPIa-0NBvmfADew-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3a860206498so4664684b6e.2
 for <cluster-devel@redhat.com>; Mon, 28 Aug 2023 21:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693284194; x=1693888994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFFOFeo2nXrYY+u6CA20+fq28ZSwwsl5cEOIz2/SyD0=;
 b=W69T5Md/y6lK6ORBZNe8dq3VfQvEys/CO6Ua5IE2Da8dDo8QpjZpDqtb0YAa6uyKst
 PvEaEJoJyPhHiP1tRJWDMLSbbjH6IX19HzHgBCpeYvms/0Tsk0OqBPmihvl3p2tVtVZl
 CV370WPf84Cfs9ux3jGDIFUK/UxjtSxbTmWdAhFySTcX8lyfXzKircdIuWsL0EkFnSBF
 V/Wdbs71+N6GQ5hvtgocPWTsawPf6myAzKytiXOet3CTkkvGdq1t+Nq4wnUrILh7W4GC
 Drvs5JbRv+SDKhJYlyAMrZzGOaIXJsY80Um1ct2uhG0Lz2Kd54epMpI12b8CLDzpV0W/
 jMEA==
X-Gm-Message-State: AOJu0YzfNO7slL0TQzoKIWWrO+3nCj78LPMsGUSx8a6awLVp1v2ulYoL
 g6znfBOosL2Lzo+ZJfeAKTLvyxLO7q8d79VUer0AZupPIIAeBm1ncnrjtwMEM60Ie07n0e1OnNL
 R7fXKmYjNnSWtuGxmKkUnUQ==
X-Received: by 2002:a54:4e90:0:b0:3a7:215c:e37 with SMTP id
 c16-20020a544e90000000b003a7215c0e37mr10756172oiy.59.1693284193921; 
 Mon, 28 Aug 2023 21:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV8sv9HmqiEUgnNzTCvlHzYYXW9mc6kx5zYQWJi03cPrU6Sxv0XK+jbnom212cYalVdz3dKw==
X-Received: by 2002:a54:4e90:0:b0:3a7:215c:e37 with SMTP id
 c16-20020a544e90000000b003a7215c0e37mr10756164oiy.59.1693284193606; 
 Mon, 28 Aug 2023 21:43:13 -0700 (PDT)
Received: from zlang-mailbox ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a170902dace00b001aadd0d7364sm8312642plx.83.2023.08.28.21.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 21:43:13 -0700 (PDT)
Date: Tue, 29 Aug 2023 12:43:09 +0800
From: Zorro Lang <zlang@redhat.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20230829044309.wdazieha4yvbnkq4@zlang-mailbox>
References: <20230823210814.1838129-1-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230823210814.1838129-1-aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 05:08:14PM -0400, Alexander Aring wrote:
> This patch adds generic 730 testcase. It will test on various fcntl()

The generic/730 has been taken. The case number might be changed when I merge
a patch, so you don't need to specify a fixed number in commit log or comments.

> corner cases that was making problems on a GFS2 filesystem. GFS2 has
> it's own lock() implementation that has it's own posix lock
> implementation behind it. There are testcases to find issues with struct
> file_lock matches. Currently the Linux kernel does not have a unique
> identifier per lock request to e.g. find the original lock request when
> a complete handler of an async lock request comes back. The current way
> is to use struct file_lock fields to fine the original lock request.
> However there was issues being found that in some cases it wasn't an
> unique match because multiple pending struct file_lock could have the
> same state. To find issues the testcases fcntl_lock_equal_file_lock and
> fcntl_lock_same_owner are introduced and their OFD variants.
> 
> Other test like fcntl_lock_kill_child tests cleanup routines when a
> process blocking in F_SETLKW to wait the lock request getting granted
> and the process gets killed.
> 
> A similar test is fcntl_lock_signal_interrupt which checks for
> side-effects e.g. unlock all previous acquired locks when a blocking
> F_SETLKW gets interrupted by a signal.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---

Is there a known issue cause a deadlock or something else? I tried to run this
case on XFS, but it's always blocked on fcntl_lock_same_owner test[1], even 1
day passed, it's still there.

[1]
[root@xxxxxx ~]# ps aux|grep fcntl
root       72361  0.0  0.0   3056  1536 pts/1    S+   12:10   0:00 /root/git/xfstests/src/fcntl_lock_same_owner /mnt/test/testfile
root       72362  0.0  0.0  19580  1280 pts/1    Sl+  12:10   0:00 /root/git/xfstests/src/fcntl_lock_same_owner /mnt/test/testfile
root       72405  0.0  0.0   6760  2048 pts/2    S+   12:12   0:00 grep --color=auto fcntl
[root@xxxxxx ~]# cat /proc/72361/stack
[<0>] do_wait+0x160/0x2f0
[<0>] kernel_wait4+0xb8/0x160
[<0>] __do_sys_wait4+0xa2/0xb0
[<0>] do_syscall_64+0x60/0x90
[<0>] entry_SYSCALL_64_after_hwframe+0x73/0xdd
[root@xxxxxx ~]# cat /proc/72362/stack
[<0>] futex_wait_queue+0x63/0x90
[<0>] futex_wait+0x189/0x270
[<0>] do_futex+0xc6/0x190
[<0>] __x64_sys_futex+0x129/0x1e0
[<0>] do_syscall_64+0x60/0x90
[<0>] entry_SYSCALL_64_after_hwframe+0x73/0xdd


>  src/Makefile                         |   5 +-
>  src/fcntl_lock_equal_file_lock.c     | 140 +++++++++++++++++++++++
>  src/fcntl_lock_equal_file_lock_ofd.c | 144 ++++++++++++++++++++++++
>  src/fcntl_lock_kill_child.c          | 148 +++++++++++++++++++++++++
>  src/fcntl_lock_same_owner.c          | 146 ++++++++++++++++++++++++
>  src/fcntl_lock_same_owner_ofd.c      | 144 ++++++++++++++++++++++++
>  src/fcntl_lock_signal_interrupt.c    | 159 +++++++++++++++++++++++++++
>  tests/generic/730                    |  70 ++++++++++++
>  tests/generic/730.out                |   2 +

The g/730 has been taken.

>  9 files changed, 957 insertions(+), 1 deletion(-)
>  create mode 100644 src/fcntl_lock_equal_file_lock.c
>  create mode 100644 src/fcntl_lock_equal_file_lock_ofd.c
>  create mode 100644 src/fcntl_lock_kill_child.c
>  create mode 100644 src/fcntl_lock_same_owner.c
>  create mode 100644 src/fcntl_lock_same_owner_ofd.c
>  create mode 100644 src/fcntl_lock_signal_interrupt.c
>  create mode 100755 tests/generic/730
>  create mode 100644 tests/generic/730.out
> 

[snip]

> diff --git a/src/fcntl_lock_same_owner.c b/src/fcntl_lock_same_owner.c
> new file mode 100644
> index 00000000..071a3b49
> --- /dev/null
> +++ b/src/fcntl_lock_same_owner.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * This program tests fcntl() operations that have two
> + * fcntl() calls in waiting state in two different threads.
> + * Those fcntl() ends in a struct file_lock have the same fl_owner
> + * field. One fcntl() call gets granted, there will be a verifier
> + * going on if the right lock was granted.
> + */
> +
> +#include <sys/wait.h>
> +#include <pthread.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +
> +static const char *filename;
> +static int fd;
> +
> +static void *do_same_owner_thread0(void *arg)
> +{
> +	struct flock fl = {
> +		.l_type = F_WRLCK,
> +		.l_whence = SEEK_SET,
> +		.l_start = 0L,
> +		.l_len = 1L,
> +	};
> +	int rv;
> +
> +	rv = fcntl(fd, F_SETLKW, &fl);
> +	if (rv == -1)
> +		_exit(1);
> +
> +	return NULL;
> +}
> +
> +static void *do_same_owner_thread1(void *arg)
> +{
> +	struct flock fl = {
> +		.l_type = F_WRLCK,
> +		.l_whence = SEEK_SET,
> +		.l_start = 1L,
> +		.l_len = 1L,
> +	};
> +	int rv;
> +
> +	rv = fcntl(fd, F_SETLKW, &fl);
> +	if (rv == -1)
> +		_exit(1);
> +
> +	return NULL;
> +}
> +
> +static void do_setup()
> +{
> +	fd = open(filename, O_RDWR | O_CREAT, 0700);
> +	if (fd == -1)
> +		_exit(1);
> +}
> +
> +static void do_teardown()
> +{
> +	close(fd);
> +}
> +
> +static void do_same_owner()
> +{
> +	struct flock fl = {
> +		.l_type = F_WRLCK,
> +		.l_whence = SEEK_SET,
> +		.l_start = 0L,
> +		.l_len = 2L,
> +	};
> +	pthread_t t[2];
> +	int pid, rv;
> +
> +	rv = fcntl(fd, F_SETLK, &fl);
> +	if (rv == -1)
> +		_exit(1);
> +
> +	pid = fork();
> +	if (pid == 0) {
> +		rv = pthread_create(&t[0], NULL, do_same_owner_thread0, NULL);
> +		if (rv != 0)
> +			_exit(1);
> +
> +		rv = pthread_create(&t[1], NULL, do_same_owner_thread1, NULL);
> +		if (rv != 0)
> +			_exit(1);
> +
> +		pthread_join(t[0], NULL);
> +		pthread_join(t[1], NULL);
> +
> +		_exit(0);
> +	}
> +
> +	/* wait threads should block */
> +	sleep(3);
> +
> +	fl.l_type = F_UNLCK;
> +	fl.l_start = 1;
> +	fl.l_len = 1;
> +	rv = fcntl(fd, F_SETLK, &fl);
> +	if (rv == -1)
> +		_exit(1);
> +
> +	sleep(3);
> +
> +	/* check if the lock() implementation got the
> +	 * right lock because two waiter with the
> +	 * same fl_owner were waiting.
> +	 */
> +	fl.l_type = F_WRLCK;
> +	rv = fcntl(fd, F_SETLK, &fl);
> +	if (!(rv == -1 && errno == EAGAIN))
> +		_exit(1);
> +
> +	fl.l_type = F_UNLCK;
> +	fl.l_start = 1;
> +	fl.l_len = 1;
> +	rv = fcntl(fd, F_SETLK, &fl);
> +	if (rv == -1)
> +		_exit(1);
> +
> +	wait(NULL);
> +}
> +
> +static void usage(const char *argv0)
> +{
> +	fprintf(stderr, "Usage: %s {filename}\n", argv0);
> +	_exit(1);
> +}
> +
> +int main(int argc, const char *argv[])
> +{
> +	if (argc != 2)
> +		usage(argv[0]);
> +
> +	filename = argv[1];
> +
> +	do_setup();
> +	do_same_owner();
> +	do_teardown();
> +
> +	return 0;
> +}

[snip]

> diff --git a/tests/generic/730 b/tests/generic/730
> new file mode 100755
> index 00000000..4a1e7f20
> --- /dev/null
> +++ b/tests/generic/730
> @@ -0,0 +1,70 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2023 Alexander Aring.  All Rights Reserved.
> +#
> +# FS QA Test 730
> +#
> +# This tests performs some fcntl() corner cases when
> +# two waiter have the same or some (fl_owner) fields. In Linux
> +# there exists no unique lock request identifier, some lock()
> +# filesystem implementation does that over struct file_lock fields.
> +# Other tests check for bad side-effects if a blocking F_SETLKW lock
> +# request got interrupted or the process got killed.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick
> +
> +# Import common functions.
> +. ./common/filter
> +
> +# real QA test starts here
> +
> +_supported_fs generic
> +_require_test
> +_require_test_program fcntl_lock_equal_file_lock
> +_require_test_program fcntl_lock_equal_file_lock_ofd
> +_require_test_program fcntl_lock_kill_child
> +_require_test_program fcntl_lock_same_owner
> +_require_test_program fcntl_lock_same_owner_ofd
> +_require_test_program fcntl_lock_signal_interrupt

Does these test programs try to do different test? You might want to
split them to seperated generic cases, or combine these .c into
one program?

> +
> +echo "Silence is golden"
> +
> +$here/src/fcntl_lock_equal_file_lock $TEST_DIR/testfile
> +if [ $? -ne 0 ]
> +then
> +	exit

So it's still the question, does these programs test independently or they
have progressive relationship? When a test fails, should we test others or
ignore others directly?

And is there more debug info output if a test fails? To figure out which test
fails and fail on where? From above .c programs, I didn't see some designed
printf, and if we exit directly at here, how to know which test fails?

Thanks,
Zorro

> +fi
> +
> +$here/src/fcntl_lock_equal_file_lock_ofd $TEST_DIR/testfile
> +if [ $? -ne 0 ]
> +then
> +	exit
> +fi
> +
> +$here/src/fcntl_lock_kill_child $TEST_DIR/testfile
> +if [ $? -ne 0 ]
> +then
> +	exit
> +fi
> +
> +$here/src/fcntl_lock_same_owner $TEST_DIR/testfile
> +if [ $? -ne 0 ]
> +then
> +	exit
> +fi
> +
> +$here/src/fcntl_lock_same_owner_ofd $TEST_DIR/testfile
> +if [ $? -ne 0 ]
> +then
> +	exit
> +fi
> +
> +$here/src/fcntl_lock_signal_interrupt $TEST_DIR/testfile
> +if [ $? -ne 0 ]
> +then
> +	exit
> +fi
> +
> +status=0
> +exit
> diff --git a/tests/generic/730.out b/tests/generic/730.out
> new file mode 100644
> index 00000000..50c3c832
> --- /dev/null
> +++ b/tests/generic/730.out
> @@ -0,0 +1,2 @@
> +QA output created by 730
> +Silence is golden
> -- 
> 2.31.1
> 

