Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E61689EB6
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Feb 2023 16:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675439950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ciXAZ44yw0DKYAKQAeN3QoFZ5scVsJLvCmjgTTv5wjM=;
	b=hlfiHXWYhjNxEhXuR+eIGaVs0dcN4LrB1AnUztR3EZTKgJcEWVF/sXhAgwmj+ecl6fy36L
	Q1PvWvfRvAPnsPW3fcxarVXBRh41Ftj30m5Wwuf2UBrUHmnqa51QYThdjr6KlBnXX+Sc+V
	63tcS8+cEcvef4CzNjA3iZgaAT4e/3o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-4lSNzhw7O4SGRMJ7i2ke_w-1; Fri, 03 Feb 2023 10:59:06 -0500
X-MC-Unique: 4lSNzhw7O4SGRMJ7i2ke_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71B963C0F221;
	Fri,  3 Feb 2023 15:59:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1DAD400DFA1;
	Fri,  3 Feb 2023 15:59:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 81B5019465A3;
	Fri,  3 Feb 2023 15:58:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 844951946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Feb 2023 15:50:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 714E7400E88D; Fri,  3 Feb 2023 15:50:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69293400F756
 for <cluster-devel@redhat.com>; Fri,  3 Feb 2023 15:50:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 477DE281DE63
 for <cluster-devel@redhat.com>; Fri,  3 Feb 2023 15:50:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-33BCYTMnN4uHaQGzqytwXw-1; Fri, 03 Feb 2023 10:50:16 -0500
X-MC-Unique: 33BCYTMnN4uHaQGzqytwXw-1
Received: by mail-wr1-f45.google.com with SMTP id r27so1221063wrr.1
 for <cluster-devel@redhat.com>; Fri, 03 Feb 2023 07:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCfzT6aYmrH2OqQ2RZxzVWm3B4Br51qWFv5znulYAtk=;
 b=2cBEegjD3UV4iE+JigeYGOC0pBNGas64Mc9RvH5lWCUEvdQXvjFqWmg/NBmvX7UgRO
 GGyPnokn99hRWYvsBEsKfYTmS4uU69q7dF3zb77Kp9uuDw6ewBLxCo7E6U2qreYYotAz
 qEs5pt3saFbkkG7Jm9ERFrxhY4LlquD+HmWIoK3FLb+Cm1AaIBZ0TL7WQzIyM/5vutrm
 iqyt9wapKkfQTQzggR9DtyYVjUtfSUkec5Rs+JF9pKdU8E7g78IWbxyT+cJIMi16qXot
 2CKk2k4b6m+KMec7kcCRCgGmS/CUO2ojJz2Y/R+3J/ZbCposd8ReZaSOVY5Am7zN17fw
 obYA==
X-Gm-Message-State: AO0yUKWrDjTcf6T1+FhBkhFWGYjJGCMUgK6MgYcxTBWdxWzcbElI7SZg
 3hYW/D4n3posrPqh2xlrUBWojWgjP9UzOMsq
X-Google-Smtp-Source: AK7set/LDy+j+zyyotWFrklHxjdVAtQoTZY8wcPeEJtNYfmE4fZFXlqIFxo8RF8cECTo2hF3VK3Hfw==
X-Received: by 2002:a5d:65c9:0:b0:2bd:e87c:e831 with SMTP id
 e9-20020a5d65c9000000b002bde87ce831mr10619287wrw.69.1675439415570; 
 Fri, 03 Feb 2023 07:50:15 -0800 (PST)
Received: from smtpclient.apple ([81.78.83.63])
 by smtp.gmail.com with ESMTPSA id
 e8-20020adffc48000000b002bdc3f5945dsm2246182wrs.89.2023.02.03.07.50.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Feb 2023 07:50:15 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <CAK-6q+gJ_JOo1KXwGsYPc1fkKnYLM3vNSZXuxxVSrdZbROzYug@mail.gmail.com>
Date: Fri, 3 Feb 2023 15:50:04 +0000
Message-Id: <A25AA8AF-24D3-419D-BC27-2741CFC3A486@cloud.com>
References: <6b008b94e3b295f572502abec8ae15da46133a64.1675351367.git.edwin.torok@cloud.com>
 <CAK-6q+gJ_JOo1KXwGsYPc1fkKnYLM3vNSZXuxxVSrdZbROzYug@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 03 Feb 2023 15:58:47 +0000
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
Cc: cluster-devel@redhat.com,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 2 Feb 2023, at 22:25, Alexander Aring <aahringo@redhat.com> wrote:
>=20
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments=
 unless you have verified the sender and know the content is safe.
>=20
> Hi,
>=20
> On Thu, Feb 2, 2023 at 10:37 AM Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix=
.com> wrote:
>>=20
>> On a 16 node virtual cluster with e1000 NICs joining the 12th node print=
s
>> SYN flood warnings for the DLM port:
>> Dec 21 01:46:41 localhost kernel: [ 2146.516664] TCP: request_sock_TCP: =
Possible SYN flooding on port 21064. Sending cookies.  Check SNMP counters.
>>=20
>> And then joining a DLM lockspace hangs:
>> ```
>> Dec 21 01:49:00 localhost kernel: [ 2285.780913] INFO: task xapi-cluster=
d:17638 blocked for more than 120 seconds.                                 =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.786476]       Not tainted 4.4.0=
+10 #1                                                                     =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.789043] "echo 0 > /proc/sys/ker=
nel/hung_task_timeout_secs" disables this message.                         =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794611] xapi-clusterd   D ffff8=
8001930bc58     0 17638      1 0x00000000                                  =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794615]  ffff88001930bc58 ffff8=
80025593800 ffff880022433800 ffff88001930c000                              =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794617]  ffff88000ef4a660 ffff8=
8000ef4a658 ffff880022433800 ffff88000ef4a000                              =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794619]  ffff88001930bc70 fffff=
fff8159f6b4 7fffffffffffffff ffff88001930bd10
>> Dec 21 01:49:00 localhost kernel: [ 2285.794644]  [<ffffffff811570fe>] ?=
 printk+0x4d/0x4f                                                          =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794647]  [<ffffffff810b1741>] ?=
 __raw_callee_save___pv_queued_spin_unlock+0x11/0x20                       =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794649]  [<ffffffff815a085d>] w=
ait_for_completion+0x9d/0x110                                              =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794653]  [<ffffffff810979e0>] ?=
 wake_up_q+0x80/0x80                                                       =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794661]  [<ffffffffa03fa4b8>] d=
lm_new_lockspace+0x908/0xac0 [dlm]                                         =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794665]  [<ffffffff810aaa60>] ?=
 prepare_to_wait_event+0x100/0x100                                         =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794670]  [<ffffffffa0402e37>] d=
evice_write+0x497/0x6b0 [dlm]                                              =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794673]  [<ffffffff811834f0>] ?=
 handle_mm_fault+0x7f0/0x13b0                                              =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794677]  [<ffffffff811b4438>] _=
_vfs_write+0x28/0xd0                                                       =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794679]  [<ffffffff811b4b7f>] ?=
 rw_verify_area+0x6f/0xd0                                                  =
                                    =E2=94=A4
>> Dec 21 01:49:00 localhost kernel: [ 2285.794681]  [<ffffffff811b4dc1>] v=
fs_write+0xb1/0x190                                                        =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794686]  [<ffffffff8105ffc2>] ?=
 __do_page_fault+0x302/0x420                                               =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794688]  [<ffffffff811b5986>] S=
yS_write+0x46/0xa0                                                         =
                                    =E2=94=82
>> Dec 21 01:49:00 localhost kernel: [ 2285.794690]  [<ffffffff815a31ae>] e=
ntry_SYSCALL_64_fastpath+0x12/0x71
>> ```
>>=20
>> The previous limit of 5 seems like an arbitrary number, that doesn't mat=
ch any
>> known DLM cluster size upper bound limit.
>>=20
>> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edvin.torok@citrix.com>
>> Cc: Christine Caulfield <ccaulfie@redhat.com>
>> Cc: David Teigland <teigland@redhat.com>
>> Cc: cluster-devel@redhat.com
>> ---
>> Notes from 2023:
>>  This patch was initially developed on 21 Dec 2017, and in production us=
e ever since.
>> I expected to drop out of our patchqueue at the next kernel upgrade, how=
ever it
>> hasn't, so I probably forgot to send it.
>>=20
>> I haven't noticed this bug again with the patch applied, and the previou=
s value
>> of '5' seems like an arbitrary limit not matching any supported upper bo=
unds
>> on DLM cluster sizes, so this patch has (unintentionally) had a 5 year t=
est
>> cycle.
>=20
> Correct, I guess the 128 coming from dlm_controld 128 max node
> boundary [0] and I think it's okay to change it to 128, especially if
> you start a cluster every "mostly" node wants to connect() at the same
> time and the backlog of 5 could be not enough to handle them.
> From my understanding the connect() will return -ECONNREFUSED in the
> case of backlog is full. As I see the code of kernel v4.0 dlm at this
> point will _not_ slow down a reattempt to run connect() again, see
> [1].

Thanks for digging into the code, that explains why 'SYN cookies' is a symp=
tom rather than a bug here.

>=20
>>=20
>> Although the join hanging forever like that may still be a bug, if the S=
YN cookies
>> consistently trigger it lets try to avoid the bug by avoiding the SYN co=
okies.
>=20
> right, it should work even with 1 as a backlog... after digging into
> the code. My guess is that [2] ran into the MAX_CONNECT_RETRIES
> condition and we do _not_ reset con->retries to 0 if connect() [3]
> fails. If this happens we are kind of stuck and we would not try to
> connect() again. Means you run into the hung task situation, because
> e.g. ping_members() will not succeed.
>=20
> The current upstream code does not have any limitations of trying
> retries and will always wait some time to try a connect() again if it
> fails. It should retry to connect so long the cluster manager tells
> dlm kernel that a specific node is still part of a lockspace resource
> and there is a transmission happening to this particular node. However
> I think pumping this value to the maximum amount of possible nodes in
> a cluster is not a bad idea.


Although there are improvements possible in how connect failures are handle=
d, this situation is quite rare outside of
a stress test under lab conditions, and this one-liner is probably the easi=
est way to improve robustness in this area.

>=20
> There is still a question of "why seeing SYN flooding" warning, but as
> I said there are a lot of connect() happening at the beginning at
> mostly the same time starting a cluster and some of them retrying
> connect() fast.

Yes, I think the SYN flood warning means just that: too many connects in a =
very short timeframe
and backlog exceeded, i.e. a symptom rather than a cause.

Best regards,
--Edwin

>=20
> ...
>=20
> - Alex
>=20
> [0] https://pagure.io/dlm/blob/c1e2ee574794e0dea68fd45783991ef7b1835901/f=
/dlm_controld/dlm_daemon.h#_177
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/dlm/lowcomms.c?h=3Dv4.0#n1226
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/dlm/lowcomms.c?h=3Dv4.0#n1168
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/dlm/lowcomms.c?h=3Dv4.0#n1220
>=20

