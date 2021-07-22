Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E8D163D246E
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Jul 2021 15:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626959801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zrvM6++D/Cm+PTxmLVCCo7fkYATcdC5zIdtektSyf68=;
	b=abez+tKLLK7TVzjhmhYsqZqFzYwa3xVrWMGZD9NIGrxJbhwoJeoNpF81FC3FrrwYR822Ps
	7/Z0Dn1rdTEzxgoNB3QgX7FpVZDeHbZCU9ABRax01PNyGjlOPnbLrmkjOpRPKcrsZJx/Yr
	OTlJY7ZrjwI26IaQ2FZWhFm6hQniVx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-cXgiWd1zPvWASwo8BE35xw-1; Thu, 22 Jul 2021 09:16:39 -0400
X-MC-Unique: cXgiWd1zPvWASwo8BE35xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65EB5100B70A;
	Thu, 22 Jul 2021 13:16:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 490EF1036D03;
	Thu, 22 Jul 2021 13:16:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F061A4BB7B;
	Thu, 22 Jul 2021 13:16:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16MDGWcv006322 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Jul 2021 09:16:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BECE1049499; Thu, 22 Jul 2021 13:16:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66E371050167
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 13:16:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E702380D2A6
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 13:16:29 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-519-ytPCPWykPO2Y_-bADIKC5w-1; Thu, 22 Jul 2021 09:16:28 -0400
X-MC-Unique: ytPCPWykPO2Y_-bADIKC5w-1
Received: by mail-il1-f200.google.com with SMTP id
	f13-20020a056e0204cdb02902087dbca2b6so3512690ils.16
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 06:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=zrvM6++D/Cm+PTxmLVCCo7fkYATcdC5zIdtektSyf68=;
	b=DYaK0oE8XXoNNpuDon8hSU19lg1JDQQaZ4OlrgdsrcufVbZ+kfSTOYiYZCzvJqmoMZ
	k04wjtYmBmBpvguqj+dX+8T6urnc/2xpMozV36mnHITvfLLJV1PiS8MKhdiJIYPkzpWm
	Dp4lkbpQHTfV8OyAbX5iTp3qHJqBSsDzpyVWFiG+WFlaHpu+jrbdz5m7sNAN9D07KC66
	7gdVZn/2GbMfMXPwoMor5nuBcGs07n9b6+93jtZSMW+YiYfqidBg2FBFaiqxqMoMXO4d
	/KDZX5qIW95ZRez0hTixqAogHeCiX8t9aczqVRwJNHw3nGQglGcgMUG/Co4Cdy/mE1pd
	O/sQ==
X-Gm-Message-State: AOAM531v4f3nEhcVThTQOaJ1mfzcbSLtixt4oWTZSFOtbQ8/PAyRITIB
	Ta4Bv1ajSjCFCyo6Jv2E8XfTcAA7ORhLEJTBv1ZhpzYysOfxjyA2vXi8Odo2PtVYXQ5dmFuAnbs
	O9EaTyG0A6YrGJbai4P7O4jQMDcH4T0ZHVZIWRM5YAAZ3PVne1Cm8wKM82jKv+2la7CvX6lswWw
	==
X-Received: by 2002:a6b:6f11:: with SMTP id k17mr30463114ioc.114.1626959787612;
	Thu, 22 Jul 2021 06:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwUDlSDVYG0sqmY8X3IQtXtYMmB6Lha2xjhU7I+R0ilxqWKIFRLvwIKzgGiUxiJnhuYVNV7A==
X-Received: by 2002:a6b:6f11:: with SMTP id k17mr30463096ioc.114.1626959787312;
	Thu, 22 Jul 2021 06:16:27 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id
	e9sm14544197ils.61.2021.07.22.06.16.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 22 Jul 2021 06:16:26 -0700 (PDT)
To: Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com>
References: <000000000000b25bb805c798a1a5@google.com>
	<20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <302c13da-9bca-efb4-9659-6a0e9979c0bb@redhat.com>
Date: Thu, 22 Jul 2021 08:16:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [syzbot] WARNING in __set_page_dirty
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
	boundary="------------A74727354DA106E60F37481C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A74727354DA106E60F37481C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/21 4:58 PM, Andrew Morton wrote:
> (cc gfs2 maintainers)
>
> On Tue, 20 Jul 2021 19:07:25 -0700 syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com> wrote:
>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d936eb238744 Revert "Makefile: Enable -Wimplicit-fallthrou..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1512834a300000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578
>> dashboard link: https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3
>> userspace arch: i386
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 inode_to_wb include/linux/backing-dev.h:283 [inline]
>> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 account_page_dirtied mm/page-writeback.c:2435 [inline]
>> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 __set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
>
Okay, sorry for the brain fart earlier. After taking a better look, I 
know exactly what this is.
This goes back to this discussion from April 2018:

https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html

in which Jan Kara pointed out that:

"The problem is we really do expect mapping->host->i_mapping == mapping as
we pass mapping and inode interchangebly in the mm code. The address_space
and inodes are separate structures because you can have many inodes
pointing to one address space (block devices). However it is not allowed
for several address_spaces to point to one inode!"

The problem is that GFS2 keeps separate address spaces for its glocks, 
and they
don't correspond 1:1 to any inode. So mapping->host is not really an 
inode for these,
and there's really almost no relation between the glock->mapping and the 
inode it
points to.

Even in the recent past, GFS2 did this for all metadata for both its 
media-backed glocks:
resource groups and inodes.

I recently posted a patch set to cluster-devel ("gfs2: replace sd_aspace 
with sd_inode" -
https://listman.redhat.com/archives/cluster-devel/2021-July/msg00066.html) 
in which
I fixed half the problem, which is the resource group case.

Unfortunately, for inode glocks it gets a lot trickier and I haven't 
found a proper solution.
But as I said, it's been a known issue for several years now. The errors 
only appear
if LOCKDEP is turned on. It would be ideal if address spaces were 
treated as fully
independent from their inodes, but no one seemed to jump on that idea, 
nor even try to
explain why we make the assumptions Jan Kara pointed out.

In the meantime, I'll keep looking for a more proper solution. This 
won't be an easy
thing to fix or I would have already fixed it.

Regards,

Bob Peterson



--------------A74727354DA106E60F37481C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 7/21/21 4:58 PM, Andrew Morton
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org">
      <pre class="moz-quote-pre" wrap="">(cc gfs2 maintainers)

On Tue, 20 Jul 2021 19:07:25 -0700 syzbot <a class="moz-txt-link-rfc2396E" href="mailto:syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com">&lt;syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello,

syzbot found the following issue on:

HEAD commit:    d936eb238744 Revert "Makefile: Enable -Wimplicit-fallthrou..
git tree:       upstream
console output: <a class="moz-txt-link-freetext" href="https://syzkaller.appspot.com/x/log.txt?x=1512834a300000">https://syzkaller.appspot.com/x/log.txt?x=1512834a300000</a>
kernel config:  <a class="moz-txt-link-freetext" href="https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578">https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578</a>
dashboard link: <a class="moz-txt-link-freetext" href="https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3">https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3</a>
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: <a class="moz-txt-link-abbreviated" href="mailto:syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com">syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com</a>

------------[ cut here ]------------
WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 inode_to_wb include/linux/backing-dev.h:283 [inline]
WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 account_page_dirtied mm/page-writeback.c:2435 [inline]
WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 __set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
</pre>
      </blockquote>
      <br>
    </blockquote>
    <p>Okay, sorry for the brain fart earlier. After taking a better
      look, I know exactly what this is.<br>
      This goes back to this discussion from April 2018:</p>
    <p><a class="moz-txt-link-freetext"
href="https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html">https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html</a><br>
    </p>
    <p>in which Jan Kara pointed out that:</p>
    <pre>"The problem is we really do expect mapping-&gt;host-&gt;i_mapping == mapping as
we pass mapping and inode interchangebly in the mm code. The address_space
and inodes are separate structures because you can have many inodes
pointing to one address space (block devices). However it is not allowed
for several address_spaces to point to one inode!"</pre>
    <p>The problem is that GFS2 keeps separate address spaces for its
      glocks, and they<br>
      don't correspond 1:1 to any inode. So mapping-&gt;host is not
      really an inode for these,<br>
      and there's really almost no relation between the
      glock-&gt;mapping and the inode it<br>
      points to.</p>
    <p>Even in the recent past, GFS2 did this for all metadata for both
      its media-backed glocks:<br>
      resource groups and inodes.<br>
      <br>
      I recently posted a patch set to cluster-devel ("gfs2: replace
      sd_aspace with sd_inode" -<br>
<a class="moz-txt-link-freetext" href="https://listman.redhat.com/archives/cluster-devel/2021-July/msg00066.html">https://listman.redhat.com/archives/cluster-devel/2021-July/msg00066.html</a>)
      in which<br>
      I fixed half the problem, which is the resource group case.</p>
    <p>Unfortunately, for inode glocks it gets a lot trickier and I
      haven't found a proper solution.<br>
      But as I said, it's been a known issue for several years now. The
      errors only appear<br>
      if LOCKDEP is turned on. It would be ideal if address spaces were
      treated as fully<br>
      independent from their inodes, but no one seemed to jump on that
      idea, nor even try to<br>
      explain why we make the assumptions Jan Kara pointed out.</p>
    <p>In the meantime, I'll keep looking for a more proper solution.
      This won't be an easy<br>
      thing to fix or I would have already fixed it.<br>
    </p>
    <p>Regards,</p>
    <p>Bob Peterson</p>
    <p><br>
    </p>
  </body>
</html>

--------------A74727354DA106E60F37481C--

