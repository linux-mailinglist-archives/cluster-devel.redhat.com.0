Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD3F619A18F
	for <lists+cluster-devel@lfdr.de>; Wed,  1 Apr 2020 00:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585692077;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TWCL2jCppG5LkoKMYYPBwC+nwI0ZdMJ2BLHFibGdvI0=;
	b=e5PkRlbbt8q5Q14+m32SCAzey6f3ByK2o/DTkIc+V8MxGjwJxA+yRGdfkRwpYXzsDWf3VC
	xe//FWdSxmfWmMc93gvBEVG2dN47NpwxPbrWmpHY+fma28K0qWhhlHR5q7PPLfB7iwgX1/
	xCcax8tTsiZ4lC6UApCHOR2LwLnVNE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-F9bdVvVxMaG96p2hAw-i_Q-1; Tue, 31 Mar 2020 18:01:16 -0400
X-MC-Unique: F9bdVvVxMaG96p2hAw-i_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AFEF149EF;
	Tue, 31 Mar 2020 22:01:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F28D699DE5;
	Tue, 31 Mar 2020 22:01:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE56C18089C8;
	Tue, 31 Mar 2020 22:01:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VLw33e029183 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 17:58:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69F132166B31; Tue, 31 Mar 2020 21:58:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6615E2166B30
	for <cluster-devel@redhat.com>; Tue, 31 Mar 2020 21:58:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E93BB80029A
	for <cluster-devel@redhat.com>; Tue, 31 Mar 2020 21:58:00 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-412-e2yZzoykOIqC3xw8fOni6w-1; Tue, 31 Mar 2020 17:57:56 -0400
X-MC-Unique: e2yZzoykOIqC3xw8fOni6w-1
Received: by mail-lj1-f196.google.com with SMTP id i20so23655215ljn.6
	for <cluster-devel@redhat.com>; Tue, 31 Mar 2020 14:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TWCL2jCppG5LkoKMYYPBwC+nwI0ZdMJ2BLHFibGdvI0=;
	b=cRbFEXDWHxPqXoxeVkOHIiE+nsS77MMU3hm1tBMBRvwMj/Q4OFXncKkoAb+cO+IV6V
	7++XsafEw3F6G6LU6Ns1lAHWILjE5xFaVMhD6iUgr7Zcdn5PuTt6d606fNpsOLy8gf8S
	dVFQAnIMij1hHGhaF433MCiMxmbj5UzWMXfzPBy7vEN12t6hk9p0Y3Jbg+E1kx3PO6a5
	3fvxXx2Ve+JxKflTB3fsTsPmT9yMmtRpzg6owH2C++j/i8v5fozai2cGCedL6bXdmagJ
	b8fWGmqlGGi3oyRrcXOH00+MIH27elx0PpFecnwMuvYCRAY1MMRDCrqwFSBWjs230Dod
	6IsQ==
X-Gm-Message-State: AGi0Puagrw3OMRXILD/2CinN3YOYKSGNTW321leC7NdEetXcVbuW0/OM
	Ly7goMUkf2JM0uoC3iLhPXZzEad5Rl0=
X-Google-Smtp-Source: APiQypLqqJuw9jAd1CY63p37brq+Jjk15eJvnAv8y6DSmIaQTu2Sc1XKr/iJFvwiG8W34Dvt8iLE6Q==
X-Received: by 2002:a2e:b559:: with SMTP id a25mr10646184ljn.280.1585691873792;
	Tue, 31 Mar 2020 14:57:53 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
	[209.85.208.175])
	by smtp.gmail.com with ESMTPSA id a4sm3775054ljb.27.2020.03.31.14.57.52
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 31 Mar 2020 14:57:53 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id p10so23421092ljn.1
	for <cluster-devel@redhat.com>; Tue, 31 Mar 2020 14:57:52 -0700 (PDT)
X-Received: by 2002:a2e:8652:: with SMTP id i18mr11824471ljj.265.1585691872539;
	Tue, 31 Mar 2020 14:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <1136650016.19797621.1585672680530.JavaMail.zimbra@redhat.com>
	<328533763.19799053.1585672849599.JavaMail.zimbra@redhat.com>
In-Reply-To: <328533763.19799053.1585672849599.JavaMail.zimbra@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2020 14:57:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whP9ufV=m6PrSWOcJCEx2Ere1fqhRYszE+Wu1D1ZjTn5Q@mail.gmail.com>
Message-ID: <CAHk-=whP9ufV=m6PrSWOcJCEx2Ere1fqhRYszE+Wu1D1ZjTn5Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VLw33e029183
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] GFS2 changes for the 5.7 merge window
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2020 at 9:41 AM Bob Peterson <rpeterso@redhat.com> wrote:
>
> Could you please pull the following changes for gfs2?

So I've pulled it, but I note that you didn't get the automated
notification of that like almost everybody else does.

The reason seems to be pretty simple: the pr-tracker-bot looks for
emails to lkml (and other mailing lists) with variations of the
subject line "[GIT PULL]" in it.

And while lkml was cc'd for your pull request, you don't use that
subject line prefix, and so pr-tracker-bot ignores your email.

I don't personally care - you do have the markers that _I_ look for,
with both "git" and "pull" in the message body, so your pull request
doesn't get lost in the chaos that is my inbox during the merge
window. So this is purely about that notification bot.

IOW, if you care, then you should change your scripting (or manual
habits, I don't know) to have that "[GIT PULL]" in the subject line,
and then you will get that nice timely notification when I've pulled
(and pushed out).

And if you don't want that notification, you can just continue doing
what you're doing.

                  Linus


