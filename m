Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBEA415B
	for <lists+cluster-devel@lfdr.de>; Sat, 31 Aug 2019 02:36:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6F6C3003A49;
	Sat, 31 Aug 2019 00:36:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10D781001284;
	Sat, 31 Aug 2019 00:36:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D49A1802218;
	Sat, 31 Aug 2019 00:36:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7V0a1bd009374 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 20:36:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DECFB5C21E; Sat, 31 Aug 2019 00:36:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D83175C1D4
	for <cluster-devel@redhat.com>; Sat, 31 Aug 2019 00:35:59 +0000 (UTC)
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
	[209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3208308FEC1
	for <cluster-devel@redhat.com>; Sat, 31 Aug 2019 00:35:58 +0000 (UTC)
Received: by mail-yw1-f54.google.com with SMTP id l79so2979675ywe.11
	for <cluster-devel@redhat.com>; Fri, 30 Aug 2019 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=vXQNyIVwxl8vIvPk12N2828MamZVgSLMDk2FHuj+gM0=;
	b=dzR8cjZ+3nR+nub3LAqSdnIaDmU9Zei9ECB6xKCTuV5fjFSQsbofHvtaU9EiC2R4jC
	5V6EVhpvwuCt92kaT/v3jJq38afC1wjJtjqD/Qo7ablymdALD/0hBJkMw8Brm7ob0yk2
	pk11GxWgt4WPEOrw8N13zc8QgpG67DtYmDZUB0GuJYd2MrnFG+3M/G9hiTVjLYiWfdpa
	YOMtGX5UZl6AmYKGFscs2IY/pCNZJu89dOFj4JC72g50EE8AzbY8kdiW1PU0t+HJeFLA
	RNRjmOoeo2XHMfIiSH3UejJZYs9Ors0aAgcz7G0uOL6GE+57A9DG/AYUvpbsms9oYaIJ
	0EFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=vXQNyIVwxl8vIvPk12N2828MamZVgSLMDk2FHuj+gM0=;
	b=uT9xAkq42UW6mA4X9BaFSYAGlSI6ddRDPaIi7SnJCYuU9RC+IOw3WGoLzCUniGCxUx
	EwxhgPMbUBYZPmeBNrCWdKl8ijpWSRBXf6w4reBbLqA2gcgZuz8Wd5tCXYgvcOJlj+ul
	k1ojK1J1z7GKKxe1Es87goRenDLFCCycwuRjfEYPrGMR1mAFhDGDSqodB8Ii4R/a+ucU
	F8AEgXS6QbE7vM6Dzntar2w7hXfOBGWHbdF9TOTAtJAS2HSBZFJwjwex1T0JvMJ2xDvu
	7NUV7Tj5qMlKC+S0GFrOODPgdGz2XTv/1DRGaiH6KH9k18DSfZDaf9THbsBuh0jD+Ipi
	5hJg==
X-Gm-Message-State: APjAAAWErfUeXToM+U/8hUNwnPYOmx0s6lX4DRkiYwHUhRXUTuTnWz/o
	HMy2yzidW5fgMcKJWPGaUA/u+pAvpBn4qDlQLQI6jEY=
X-Google-Smtp-Source: APXvYqzV0LKoCLnIrcGbOSDa1MAJIHatfYVmXrik5m6Zgagt/r8FFddEkpoeTOZ7YqxLpRzaf1xSKAWot9PFlOSqt2Q=
X-Received: by 2002:a81:8405:: with SMTP id u5mr13579329ywf.118.1567211757711; 
	Fri, 30 Aug 2019 17:35:57 -0700 (PDT)
MIME-Version: 1.0
From: Turritopsis Dohrnii Teo En Ming <tdteoenming@gmail.com>
Date: Sat, 31 Aug 2019 08:35:44 +0800
Message-ID: <CANnei0Eiq9=y+auKWXubTHN6Rc3cCZ-ba57W34h4PYMLxWkzNQ@mail.gmail.com>
To: cluster-devel@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sat, 31 Aug 2019 00:35:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 31 Aug 2019 00:35:58 +0000 (UTC) for IP:'209.85.161.54'
	DOMAIN:'mail-yw1-f54.google.com' HELO:'mail-yw1-f54.google.com'
	FROM:'tdteoenming@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.161.54 mail-yw1-f54.google.com 209.85.161.54
	mail-yw1-f54.google.com <tdteoenming@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] Singaporean Mr. Teo En Ming's Refugee Seeking
 Attempts, In The Search of a Substantially Better Life
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Sat, 31 Aug 2019 00:36:09 +0000 (UTC)

Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts, In
The Search of a Substantially Better Life

In reverse chronological order:

[1] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogspot blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiwan-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-government-of-taiwan-for-refugee-status/

[2] Application for Refugee Status at the United Nations Refugee
Agency, Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees, Bangkok

Link: https://www.youtube.com/watch?v=utpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 31st August 2019: 593

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 31st August 2019: 2815
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA





-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

