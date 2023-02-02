Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE66889AC
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Feb 2023 23:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675376726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B8BHBNa+yNC4hDxX+kSVeo8iDcZfNEIlhda9yEMbHoc=;
	b=Md3h3fuHhavVGj8y9L87UWnHy3b2YuKKknwOk5Kkfffi1Gb2kVHLfM4lHphBZtyz6DLdLD
	xDqvQPUGAPCeEETy/v/BlYIX4cIPoOOG24E1ioKWOSeVIeOLOXQQQ0bH4EywDawigxJBSJ
	YbdCkdnhiqfuLKI+vAZUWCwJJ1bZwXA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-bfNZmodSP2iGEHivVPDBIA-1; Thu, 02 Feb 2023 17:25:23 -0500
X-MC-Unique: bfNZmodSP2iGEHivVPDBIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EB8D101A521;
	Thu,  2 Feb 2023 22:25:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25AC5404BEC1;
	Thu,  2 Feb 2023 22:25:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD6E919465A3;
	Thu,  2 Feb 2023 22:25:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B2E0D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Feb 2023 22:25:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A06E8C15BAE; Thu,  2 Feb 2023 22:25:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A6DC15BA0
 for <cluster-devel@redhat.com>; Thu,  2 Feb 2023 22:25:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C639801779
 for <cluster-devel@redhat.com>; Thu,  2 Feb 2023 22:25:17 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-Nj1AcdvpMsiq5dYtalef5A-1; Thu, 02 Feb 2023 17:25:16 -0500
X-MC-Unique: Nj1AcdvpMsiq5dYtalef5A-1
Received: by mail-ej1-f72.google.com with SMTP id
 ti11-20020a170907c20b00b00886244203fcso2432682ejc.2
 for <cluster-devel@redhat.com>; Thu, 02 Feb 2023 14:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8BHBNa+yNC4hDxX+kSVeo8iDcZfNEIlhda9yEMbHoc=;
 b=1kC+A63NI9WUXVAnZjaiYnFjdRnc6o1kj9oG8w+1BtkT2oTklY9IStRTv3z63z4kqm
 JHd0bELt4QfIEMsUtYCpei33ezz8UmS9Zm9dvdAa2XWyGqdkngEI9nNg8RSusbYy/gGv
 LG44iaLTfTtxT85Cs4pbDkuvJW6XT0DmYmAHFgRVR+Xls4SPNk98gm5BIrNzXdmAO5aP
 YCK6WeChr/ThNMkvfvK90RZ/+PUDK8PfazAxOwnKA0kNteeCTpysYSB7dqEJmqZCqQu2
 zARlsSXLvSzSpAh6wiFLN6VqpuItyPp+SWdokLGytmyd15G1PdZS3h3pfPf6PmfIYL57
 67dA==
X-Gm-Message-State: AO0yUKWlp7McZ4Z6MPToyMWJ2hT+5sgurR63AsuWvpLbNPX8N3XSMnHc
 RVxEqByMb7C5/Ts0krEpJavGC2PhpkeWQKogIgyS26vNEjilgPsdWiscMSNJvKgtZz92GZ6g7C3
 4ct2EcY2Wjxkjpc41l9DHBPuR0djAZZqXkDHj7A==
X-Received: by 2002:a05:6402:360a:b0:499:cfee:8d96 with SMTP id
 el10-20020a056402360a00b00499cfee8d96mr2481749edb.21.1675376714502; 
 Thu, 02 Feb 2023 14:25:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/RS3nWD5I2qidy/TUBFe5KzmDNDoQo3pywjpkX7ZNqRxjHHFLYfFeOAyYKMUUZ3YPLVMy4JsWgYmPMR6yaBs0=
X-Received: by 2002:a05:6402:360a:b0:499:cfee:8d96 with SMTP id
 el10-20020a056402360a00b00499cfee8d96mr2481747edb.21.1675376714326; Thu, 02
 Feb 2023 14:25:14 -0800 (PST)
MIME-Version: 1.0
References: <6b008b94e3b295f572502abec8ae15da46133a64.1675351367.git.edwin.torok@cloud.com>
In-Reply-To: <6b008b94e3b295f572502abec8ae15da46133a64.1675351367.git.edwin.torok@cloud.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 2 Feb 2023 17:25:02 -0500
Message-ID: <CAK-6q+gJ_JOo1KXwGsYPc1fkKnYLM3vNSZXuxxVSrdZbROzYug@mail.gmail.com>
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] DLM: increase socket backlog to avoid
 hangs with 16 nodes
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 2, 2023 at 10:37 AM Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.c=
om> wrote:
>
> On a 16 node virtual cluster with e1000 NICs joining the 12th node prints
> SYN flood warnings for the DLM port:
> Dec 21 01:46:41 localhost kernel: [ 2146.516664] TCP: request_sock_TCP: P=
ossible SYN flooding on port 21064. Sending cookies.  Check SNMP counters.
>
> And then joining a DLM lockspace hangs:
> ```
> Dec 21 01:49:00 localhost kernel: [ 2285.780913] INFO: task xapi-clusterd=
:17638 blocked for more than 120 seconds.                                  =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.786476]       Not tainted 4.4.0+=
10 #1                                                                      =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.789043] "echo 0 > /proc/sys/kern=
el/hung_task_timeout_secs" disables this message.                          =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794611] xapi-clusterd   D ffff88=
001930bc58     0 17638      1 0x00000000                                   =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794615]  ffff88001930bc58 ffff88=
0025593800 ffff880022433800 ffff88001930c000                               =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794617]  ffff88000ef4a660 ffff88=
000ef4a658 ffff880022433800 ffff88000ef4a000                               =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794619]  ffff88001930bc70 ffffff=
ff8159f6b4 7fffffffffffffff ffff88001930bd10
> Dec 21 01:49:00 localhost kernel: [ 2285.794644]  [<ffffffff811570fe>] ? =
printk+0x4d/0x4f                                                           =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794647]  [<ffffffff810b1741>] ? =
__raw_callee_save___pv_queued_spin_unlock+0x11/0x20                        =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794649]  [<ffffffff815a085d>] wa=
it_for_completion+0x9d/0x110                                               =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794653]  [<ffffffff810979e0>] ? =
wake_up_q+0x80/0x80                                                        =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794661]  [<ffffffffa03fa4b8>] dl=
m_new_lockspace+0x908/0xac0 [dlm]                                          =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794665]  [<ffffffff810aaa60>] ? =
prepare_to_wait_event+0x100/0x100                                          =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794670]  [<ffffffffa0402e37>] de=
vice_write+0x497/0x6b0 [dlm]                                               =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794673]  [<ffffffff811834f0>] ? =
handle_mm_fault+0x7f0/0x13b0                                               =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794677]  [<ffffffff811b4438>] __=
vfs_write+0x28/0xd0                                                        =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794679]  [<ffffffff811b4b7f>] ? =
rw_verify_area+0x6f/0xd0                                                   =
                                   =E2=94=A4
> Dec 21 01:49:00 localhost kernel: [ 2285.794681]  [<ffffffff811b4dc1>] vf=
s_write+0xb1/0x190                                                         =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794686]  [<ffffffff8105ffc2>] ? =
__do_page_fault+0x302/0x420                                                =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794688]  [<ffffffff811b5986>] Sy=
S_write+0x46/0xa0                                                          =
                                   =E2=94=82
> Dec 21 01:49:00 localhost kernel: [ 2285.794690]  [<ffffffff815a31ae>] en=
try_SYSCALL_64_fastpath+0x12/0x71
> ```
>
> The previous limit of 5 seems like an arbitrary number, that doesn't matc=
h any
> known DLM cluster size upper bound limit.
>
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com>
> Cc: Christine Caulfield <ccaulfie@redhat.com>
> Cc: David Teigland <teigland@redhat.com>
> Cc: cluster-devel@redhat.com
> ---
> Notes from 2023:
>   This patch was initially developed on 21 Dec 2017, and in production us=
e ever since.
> I expected to drop out of our patchqueue at the next kernel upgrade, howe=
ver it
> hasn't, so I probably forgot to send it.
>
> I haven't noticed this bug again with the patch applied, and the previous=
 value
> of '5' seems like an arbitrary limit not matching any supported upper bou=
nds
> on DLM cluster sizes, so this patch has (unintentionally) had a 5 year te=
st
> cycle.

Correct, I guess the 128 coming from dlm_controld 128 max node
boundary [0] and I think it's okay to change it to 128, especially if
you start a cluster every "mostly" node wants to connect() at the same
time and the backlog of 5 could be not enough to handle them.
From my understanding the connect() will return -ECONNREFUSED in the
case of backlog is full. As I see the code of kernel v4.0 dlm at this
point will _not_ slow down a reattempt to run connect() again, see
[1].

>
> Although the join hanging forever like that may still be a bug, if the SY=
N cookies
> consistently trigger it lets try to avoid the bug by avoiding the SYN coo=
kies.

right, it should work even with 1 as a backlog... after digging into
the code. My guess is that [2] ran into the MAX_CONNECT_RETRIES
condition and we do _not_ reset con->retries to 0 if connect() [3]
fails. If this happens we are kind of stuck and we would not try to
connect() again. Means you run into the hung task situation, because
e.g. ping_members() will not succeed.

The current upstream code does not have any limitations of trying
retries and will always wait some time to try a connect() again if it
fails. It should retry to connect so long the cluster manager tells
dlm kernel that a specific node is still part of a lockspace resource
and there is a transmission happening to this particular node. However
I think pumping this value to the maximum amount of possible nodes in
a cluster is not a bad idea.

There is still a question of "why seeing SYN flooding" warning, but as
I said there are a lot of connect() happening at the beginning at
mostly the same time starting a cluster and some of them retrying
connect() fast.

...

- Alex

[0] https://pagure.io/dlm/blob/c1e2ee574794e0dea68fd45783991ef7b1835901/f/d=
lm_controld/dlm_daemon.h#_177
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lowcomms.c?h=3Dv4.0#n1226
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lowcomms.c?h=3Dv4.0#n1168
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/dlm/lowcomms.c?h=3Dv4.0#n1220

