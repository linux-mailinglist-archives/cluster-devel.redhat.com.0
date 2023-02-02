Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2F6882BF
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Feb 2023 16:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675352225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aXSBGULcAVAIB+s35NJUFEw/Fe7TLnpz76nopyvj5ec=;
	b=gtzh+WeafPOMqe9YXsB8KnDN7pagGL3JxtWyAydDup0WTtzwxcvfw87Mr3KvlRqTbCuswO
	RFoHrCuvQGNdJ/LQEqmDlqfg7nEZbO3mHLhp6l8TWnmVnlOvtufnLOn85WoHL+ytkEAb3v
	cdX0KuEd/RnP3DWpVfQ8Pq3FZdH019A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-4opSvkxtO6eU_ohSZD6lZg-1; Thu, 02 Feb 2023 10:37:00 -0500
X-MC-Unique: 4opSvkxtO6eU_ohSZD6lZg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 304241C189A4;
	Thu,  2 Feb 2023 15:36:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 488B4492C14;
	Thu,  2 Feb 2023 15:36:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE05419465A3;
	Thu,  2 Feb 2023 15:36:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E018C1946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Feb 2023 15:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9886B14171B6; Thu,  2 Feb 2023 15:24:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90DDC140EBF6
 for <cluster-devel@redhat.com>; Thu,  2 Feb 2023 15:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7609F85A5B1
 for <cluster-devel@redhat.com>; Thu,  2 Feb 2023 15:24:07 +0000 (UTC)
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-qJLFnk1kNTSn_NDFA3Q-0Q-1; Thu, 02 Feb 2023 10:24:05 -0500
X-MC-Unique: qJLFnk1kNTSn_NDFA3Q-0Q-1
X-SBRS: 4.0
X-MesageID: 95796629
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:U78376tvwPfi9GgP+2kzYaQfMefnVGFeMUV32f8akzHdYApBsoF/q
 tZmKW2Ob/iCZTb9e4x3btjn9BxQ65OHndBhSARtry9nESsa+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWGzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGCsIXEuu1rOM2I34QctMiuU8NtTZI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzBUtlOT47Yw+W/Q5AdwzKLsIJzefdniqcB9zxvH9
 zyYpTWR7hcyJuzA12bY0yKXgerTwwfafZJJFb3o+as/6LGU7jNKU0BHPbehmtGlh0+xX9tZJ
 2QO9yYupLR0/0uuJvH2WwCjvHOe+xIRRddUO/c35AGE1uzf5APxLmMPRyNFZt0rnNU7STwjy
 hmCmNaBLThutqCFDHGQ7LGZqRusNiUPa2wPfykJSU0C+daLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0jlss5jIjqrGrfvHGnhLjFbxEv+zfICzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/CI+TfNDKq8gj9yjn9ZKme6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+B2nH9gmTuMFcuhp/hC7VZ5TCfFIYrpzXPUNrxphE96iFq9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9rivw/G7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3RMSg+NuK0AcsvxZ/5VAR1VWuVN7EYSd7HxM8im1EfJ9HLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:tKoZDqoRhagihA+plqALHG0aV5urL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZnishILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAR2SS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+wQ+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRheerRfb8xPT9GA+cyjpAV74RGIFqewpF4t1H3Wxa0e
 UkZS1QevibpUmhOl1d6iGdpjUImAxel0MKj2XozEcL6PaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NkeQg+Csa5XZcjEBS5dL7tUYvJrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFkgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve4PcV
 T6ISFlXEIJCjLT4Je1reN2Gzj2MRSAYQg=
X-IronPort-AV: E=Sophos;i="5.97,267,1669093200"; d="scan'208";a="95796629"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <linux-kernel@vger.kernel.org>
Date: Thu, 2 Feb 2023 15:22:50 +0000
Message-ID: <6b008b94e3b295f572502abec8ae15da46133a64.1675351367.git.edwin.torok@cloud.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 02 Feb 2023 15:36:31 +0000
Subject: [Cluster-devel] [PATCH] DLM: increase socket backlog to avoid hangs
 with 16 nodes
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
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On a 16 node virtual cluster with e1000 NICs joining the 12th node prints
SYN flood warnings for the DLM port:
Dec 21 01:46:41 localhost kernel: [ 2146.516664] TCP: request_sock_TCP: Possible SYN flooding on port 21064. Sending cookies.  Check SNMP counters.

And then joining a DLM lockspace hangs:
```
Dec 21 01:49:00 localhost kernel: [ 2285.780913] INFO: task xapi-clusterd:17638 blocked for more than 120 seconds.                                                                     │
Dec 21 01:49:00 localhost kernel: [ 2285.786476]       Not tainted 4.4.0+10 #1                                                                                                         │
Dec 21 01:49:00 localhost kernel: [ 2285.789043] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.                                                             │
Dec 21 01:49:00 localhost kernel: [ 2285.794611] xapi-clusterd   D ffff88001930bc58     0 17638      1 0x00000000                                                                      │
Dec 21 01:49:00 localhost kernel: [ 2285.794615]  ffff88001930bc58 ffff880025593800 ffff880022433800 ffff88001930c000                                                                  │
Dec 21 01:49:00 localhost kernel: [ 2285.794617]  ffff88000ef4a660 ffff88000ef4a658 ffff880022433800 ffff88000ef4a000                                                                  │
Dec 21 01:49:00 localhost kernel: [ 2285.794619]  ffff88001930bc70 ffffffff8159f6b4 7fffffffffffffff ffff88001930bd10
Dec 21 01:49:00 localhost kernel: [ 2285.794644]  [<ffffffff811570fe>] ? printk+0x4d/0x4f                                                                                              │
Dec 21 01:49:00 localhost kernel: [ 2285.794647]  [<ffffffff810b1741>] ? __raw_callee_save___pv_queued_spin_unlock+0x11/0x20                                                           │
Dec 21 01:49:00 localhost kernel: [ 2285.794649]  [<ffffffff815a085d>] wait_for_completion+0x9d/0x110                                                                                  │
Dec 21 01:49:00 localhost kernel: [ 2285.794653]  [<ffffffff810979e0>] ? wake_up_q+0x80/0x80                                                                                           │
Dec 21 01:49:00 localhost kernel: [ 2285.794661]  [<ffffffffa03fa4b8>] dlm_new_lockspace+0x908/0xac0 [dlm]                                                                             │
Dec 21 01:49:00 localhost kernel: [ 2285.794665]  [<ffffffff810aaa60>] ? prepare_to_wait_event+0x100/0x100                                                                             │
Dec 21 01:49:00 localhost kernel: [ 2285.794670]  [<ffffffffa0402e37>] device_write+0x497/0x6b0 [dlm]                                                                                  │
Dec 21 01:49:00 localhost kernel: [ 2285.794673]  [<ffffffff811834f0>] ? handle_mm_fault+0x7f0/0x13b0                                                                                  │
Dec 21 01:49:00 localhost kernel: [ 2285.794677]  [<ffffffff811b4438>] __vfs_write+0x28/0xd0                                                                                           │
Dec 21 01:49:00 localhost kernel: [ 2285.794679]  [<ffffffff811b4b7f>] ? rw_verify_area+0x6f/0xd0                                                                                      ┤
Dec 21 01:49:00 localhost kernel: [ 2285.794681]  [<ffffffff811b4dc1>] vfs_write+0xb1/0x190                                                                                            │
Dec 21 01:49:00 localhost kernel: [ 2285.794686]  [<ffffffff8105ffc2>] ? __do_page_fault+0x302/0x420                                                                                   │
Dec 21 01:49:00 localhost kernel: [ 2285.794688]  [<ffffffff811b5986>] SyS_write+0x46/0xa0                                                                                             │
Dec 21 01:49:00 localhost kernel: [ 2285.794690]  [<ffffffff815a31ae>] entry_SYSCALL_64_fastpath+0x12/0x71
```

The previous limit of 5 seems like an arbitrary number, that doesn't match any
known DLM cluster size upper bound limit.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Cc: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>
Cc: cluster-devel@redhat.com
---
Notes from 2023:
  This patch was initially developed on 21 Dec 2017, and in production use ever since.
I expected to drop out of our patchqueue at the next kernel upgrade, however it
hasn't, so I probably forgot to send it.

I haven't noticed this bug again with the patch applied, and the previous value
of '5' seems like an arbitrary limit not matching any supported upper bounds
on DLM cluster sizes, so this patch has (unintentionally) had a 5 year test
cycle.

Although the join hanging forever like that may still be a bug, if the SYN cookies
consistently trigger it lets try to avoid the bug by avoiding the SYN cookies.
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 4450721ec..105c9138b 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1774,7 +1774,7 @@ static int dlm_listen_for_all(void)
 	sock->sk->sk_data_ready = lowcomms_listen_data_ready;
 	release_sock(sock->sk);
 
-	result = sock->ops->listen(sock, 5);
+	result = sock->ops->listen(sock, 128);
 	if (result < 0) {
 		dlm_close_sock(&listen_con.sock);
 		return result;
-- 
2.34.1

