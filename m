Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B4A787F
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Sep 2019 04:10:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E35318B3D88;
	Wed,  4 Sep 2019 02:10:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A48E1001959;
	Wed,  4 Sep 2019 02:10:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A8322551B;
	Wed,  4 Sep 2019 02:10:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8428AaM002702 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 22:08:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37CC619D7A; Wed,  4 Sep 2019 02:08:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30C5F19C4F
	for <cluster-devel@redhat.com>; Wed,  4 Sep 2019 02:08:05 +0000 (UTC)
Received: from wblock2.skku.edu (wblock2.skku.edu [115.145.128.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF8BC2F30D1
	for <cluster-devel@redhat.com>; Wed,  4 Sep 2019 02:08:01 +0000 (UTC)
Received: from ptmsg2.skku.edu ( [115.145.128.200])
	by wblock2.skku.edu (DEEPSoft WBlock.s.h 5.04.511)
	with ESMTP id <OF91C20228.BA07262A-ON4925846B.000B9F9F@skku.ac.kr>
	for <cluster-devel@redhat.com>; Wed, 4 Sep 2019 11:06:32 +0900
Received: from mail3.skku.edu ([115.145.128.191])
	by ptmsg2.skku.edu (IBM Domino Release 9.0.1FP10)
	with ESMTP id 2019090411105562-1998339 ;
	Wed, 4 Sep 2019 11:10:55 +0900 
From: "=?EUC-KR?B?x9G067HU?=" <hdg9400@skku.edu>
To: cluster-devel@redhat.com
Importance: Normal
Sensitivity: 
Date: Wed, 4 Sep 2019 11:06:58 +0900
X-MIMETrack: Itemize by http on ptmail3/skku(Release 9.0.1FP10HF193 | April 16,
	2018) at 2019-09-04 11:06:58,
	Serialize by Router on ptmail3/skku(Release 9.0.1FP10HF193 | April 16,
	2018) at 2019-09-04 11:06:58,
	Serialize complete at 2019-09-04 11:06:58,
	Itemize by SMTP Server on ptmsg2/skku(Release 9.0.1FP10|January  15,
	2018) at 2019-09-04 11:10:55,
	Serialize by Router on ptmsg2/skku(Release 9.0.1FP10|January  15,
	2018) at 2019-09-04 11:10:55,
	Serialize complete at 2019-09-04 11:10:55
Message-ID: <OF91C20228.BA07262A-ON4925846B.000B9F9F@skku.ac.kr>
X-ematesmtpid: 91C20228BA07262A4925846B000B9F9F
MIME-Version: 1.0
X-TNEFEvaluated: 1
Content-Transfer-Encoding: base64
X-WB-RES: 13:CHK_HDR_FROM, HEADER_MAILER_013, HEADER_CT_016,
	AD_TEXT_KOR_REJECT_002, HEADER_ETC_017, AND_AD_405,
	CAP_TEXT_KOR_013 str=0001.0A15020F.5D6F1AE6.005F, ss=3, sh,
	re=0.000, recu=0.000, reip=0.000, cl=3, cld=1, fgs=0
Content-Type: text/html; charset="utf-8"
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 04 Sep 2019 02:08:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 04 Sep 2019 02:08:03 +0000 (UTC) for IP:'115.145.128.246'
	DOMAIN:'wblock2.skku.edu' HELO:'wblock2.skku.edu'
	FROM:'hdg9400@skku.edu' RCPT:''
X-RedHat-Spam-Score: 0.812  (FROM_EXCESS_BASE64, HTML_IMAGE_ONLY_20,
	HTML_MESSAGE, MIME_HTML_ONLY, SPF_HELO_NONE, SPF_PASS,
	T_REMOTE_IMAGE) 115.145.128.246 wblock2.skku.edu 115.145.128.246
	wblock2.skku.edu <hdg9400@skku.edu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] How do the nodes that are mounting GFS2 see the
 latest version of file system?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Wed, 04 Sep 2019 02:10:52 +0000 (UTC)

PGh0bWw+PGhlYWQ+PHN0eWxlIHR5cGU9InRleHQvY3NzIiBpZD0iTmFtb1NFX19HZW5lcmFsU3R5
bGUiPiBib2R5e2ZvbnQtZmFtaWx5IDrrj4vsm4A7IGNvbG9yIDogIzAwMDAwMDsgZm9udC1zaXpl
IDogMTBwdDsgd29yZC1XcmFwIDogYnJlYWstd29yZDsgbWFyZ2luIDogN3B4IDAgMCA3cHg7fSBw
LGxpe2xpbmUtaGVpZ2h0OjEuMjsgIHdvcmQtd3JhcDogYnJlYWstd29yZDsgbWFyZ2luLXRvcDow
OyBtYXJnaW4tYm90dG9tOjA7fSBib2R5e292ZXJmbG93OmF1dG87fS5OYW1vU0VfbGF5b3V0bG9j
a19zaG93IHsgd29yZC1icmVhazogYnJlYWstYWxsO308L3N0eWxlPjxsaW5rIHR5cGU9InRleHQv
Y3NzIiByZWw9InN0eWxlc2hlZXQiIGhyZWY9Ii9nd19yZXNvdXJjZS9jc3MvbmFtb19iYXNpYy5j
c3MiPjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBj
aGFyc2V0PXV0Zi04Ij48L2hlYWQ+PGJvZHkgY2xhc3M9IiI+PHA+SGkgYWxsLDwvcD48cD48YnI+
PC9wPjxwPkkgYXNrZWQgYSBzaW1pbGFyIHF1ZXN0aW9uIGJlZm9yZSwgYnV0IEkgZGlkbid0IHVu
ZGVyc3RhbmQgY2xlYXJseSwgc28gSSBhc2sgYWdhaW4uPC9wPjxwPjxicj48L3A+PHA+U3VwcG9z
ZSB0aGF0IHNlcnZlciBBIGFuZCBCIGFyZSBtb3VudGluZyB0aGUgZ2ZzMiBmaWxlIHN5c3RlbSBv
biBzdG9yYWdlIHNlcnZlciBDLjwvcD48cD48YnI+PC9wPjxwPkluIGdlbmVyYWwsIHRoZSBtb3Vu
dCBwcm9jZXNzIGlzIGtub3duIHRvIHJlYWQgdGhlIHN1cGVyYmxvY2sgb24gdGhlIGRpc2sgYW5k
IGluaXRpYWxpemUgdGhlIG1ldGFkYXRhIGRhdGEgc3RydWN0dXJlcyBvbiBkaXNrIHRvIHRoZSBm
aWxlIHN5c3RlbSBkYXRhIHN0cnVjdHVyZXMgaW4gbWVtb3J5LjwvcD48cD48YnI+PC9wPjxwPldo
ZW4gdXNpbmcgdGhlIGxvY2FsIGZpbGUgc3lzdGVtIGFzIGFzc3VtZWQgYWJvdmUsIHVwZGF0ZXMg
ZnJvbSBBIGFyZSBub3QgcmVmbGVjdGVkIGluIEIuPC9wPjxwPkJlY2F1c2UgQiBkaWQgbm90IHJl
LXJlYWQgdGhlIHN1cGVyYmxvY2sgb24gZGlzaywgaXQmbmJzcDtjYW5ub3Qgc2VlJm5ic3A7dGhl
IGZpbGVzIHRoYXQgQSB1cGRhdGVkLjwvcD48cD48YnI+PC9wPjxwPkhvd2V2ZXIsIHdoZW4gdXNp
bmcmbmJzcDtHRlMyLCBCJ3MgZmlsZSBzeXN0ZW0gZGF0YSBzdHJ1Y3R1cmVzIGluIG1lbW9yeSBh
cmUgdXBkYXRlZCBhcyBzb29uIGFzIEEgdXBkYXRlcy4mbmJzcDs8L3A+PHA+SW4gb3RoZXIgd29y
ZHMsIEkgdGhpbmsgdGhhdCB0aGUgZmlsZSBzeXN0ZW0gc3RhdGUgb2YgZWl0aGVyIGRpc2sgaXMg
c3luY2hyb25pemVkIHdpdGggdGhlIG1lbW9yeSBzdGF0ZSBvZiBCLjwvcD48cD48YnI+PC9wPjxw
PkhvdyBjYW4gQidzIGZpbGUgc3lzdGVtIGRhdGEgc3RydWN0dXJlIGJlIGtlcHQgdXAgdG8gZGF0
ZT88L3A+PHA+PGJyPjwvcD48cD5JcyBCIHJlcmVhZGluZyB0aGUgc3VwZXJibG9jayBldmVyeSB0
aW1lIGxpa2UgdGhlJm5ic3A7bW91bnQgcHJvY2Vzcz8gSG93IGRvIEIgbWFjaGluZSZuYnNwO2tu
b3cgdGhhdCB0aGUgZGlzaydzIGZpbGUgc3lzdGVtIGhhcyBiZWVuIHVwZGF0ZWQ/PC9wPjxwPjxi
cj48L3A+PHA+SSB3b3VsZCBsaWtlIHRvIGtub3cmbmJzcDthIGRldGFpbGVkIGV4cGxhbmF0aW9u
LjwvcD48cD48YnI+PC9wPjxwPkJlc3QgcmVnYXJkcyw8L3A+PHA+RGFlZ3l1PC9wPjxpbWcgc3Jj
PSJodHRwOi8vcHRtc2cuc2trdS5lZHUvZW1hdGVfYXBwL2VtYXRlbWRuLm5zZi9tZG5mb3JtP09w
ZW5Gb3JtJnNlbmRlcj1oZGc5NDAwQHNra3UuZWR1JnJlY2VpdmVyPWNsdXN0ZXItZGV2ZWxAcmVk
aGF0LmNvbSZrZXk9OTFDMjAyMjhCQTA3MjYyQTQ5MjU4NDZCMDAwQjlGOUYiIHdpZHRoPTAgaGVp
Z2h0PTAgYm9yZGVyPTA+PC9ib2R5PjwvaHRtbD4=

